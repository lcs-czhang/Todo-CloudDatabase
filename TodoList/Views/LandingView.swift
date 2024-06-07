//
//  LandingView.swift
//  TodoList
//
//  Created by Russell Gordon on 2024-04-08.
//

import SwiftUI

struct LandingView: View {
    
    // MARK: Stored properties
    
    // The search text
    @State var searchText = ""
    
    // The list of to-do items
    @State var viewModel = TodoListViewModel()
    
    @State var presentingNewItemSheet = false
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            
            VStack {
                
                if viewModel.todos.isEmpty{
                    
                    if viewModel.fetchingTodos {
                        
                        Spacer()
                        
                        ProgressView()
                        
                        Spacer()
                        
                    } else {

                        ContentUnavailableView(
                            "No to-do items",
                            systemImage: "pencil.tip.crop.circle.badge.plus",
                            description: Text("Add a reminder to get started")
                        )

                    }
                }else{
                    
                    //Show the list of items
                    List($viewModel.todos) { $todo in
                        
                        ItemView(currentItem: $todo)
                        // Delete item
                            .swipeActions {
                                Button(
                                    "Delete",
                                    role: .destructive,
                                    action: {
                                        viewModel.delete(todo)
                                    }
                                )
                            }
                        
                    }
                }
                
            }
            .navigationTitle("To do")
            .sheet(isPresented: $presentingNewItemSheet) {
                NewItemView(showSheet: $presentingNewItemSheet)
                    .presentationDetents([.medium, .fraction(0.15)])
            }
            // Add a tool bar to the top of the interface
            // NOTE: For a toolbar to appear, it must be
            //       inside a NavigationView or NavigationStack.
            .toolbar {
                // Add a button to trigger showing the sheet
                ToolbarItem(placement: .automatic) {
                    Button {
                        presentingNewItemSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            //Handle Searching in the list
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                Task {
                    try await viewModel.filterTodos(on: searchText)
                }
            }
            
        }
        .environment(viewModel)
    }
}

#Preview {
    LandingView()
}
