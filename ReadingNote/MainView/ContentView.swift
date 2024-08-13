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
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("\(Int(totalReadingToday())) minutes of reading today")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                
                List {
                    BooksContent(books: books)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Read books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Book", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddBooksView()
            }
            
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

#Preview {
    ContentView()
}
