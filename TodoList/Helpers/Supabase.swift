//
//  Supabase.swift
//  TodoList
//
//  Created by Yuzhou Zhang on 2024-05-24.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://dubmggkhxzoyjcobcqdp.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR1Ym1nZ2toeHpveWpjb2JjcWRwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM2NjE0OTEsImV4cCI6MjAyOTIzNzQ5MX0.kzFvctkWA08mKcK-PNSijWBLjRaACbkjRLxWdjC76fY"
)
