//
//  ContentView.swift
//  ReadingNote
//
//  Created by Sora Harada on 20/7/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.readDate, order: .reverse)])
    var books: FetchedResults<Book>
    
    @State private var showingAddView = false
    @State private var showingMenuView = false
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    
                    Text("\(Int(totalReadingToday())) minutes of reading today")
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                    
                    List {
                        BooksContent(books: books)
                    }
                    .listStyle(.plain)
                }
                .sheet(isPresented: $showingAddView) { AddBooksView() }
                
                SideMenuView(books: books, showingMenuView: $showingMenuView)
            }
            .toolbar(showingMenuView ? .hidden : .visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showingAddView.toggle() }
                    label: { Label("Book", systemImage: "plus.circle") }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { showingMenuView.toggle() }
                    label: { Image(systemName: "line.3.horizontal") }
                }
            }
            .navigationTitle("Read books")
        }
        .navigationViewStyle(.stack)
    }
    
    func totalReadingToday() -> Double {
        var readingToday: Double = 0
        for item in books {
            if Calendar.current.isDateInToday(item.readDate!) {
                readingToday += item.readingTime
            }
        }
        return readingToday
    }
    
}
