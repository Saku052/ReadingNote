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
    @State public var whichBook: String = "All"
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Text("\(Int(totalReadingToday())) minutes of reading today")
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                    
                    if (whichBook == "All") {
                        // When app is opened
                        PieChartView(books: checkWhichBook())
                    } else {
                        // When Book title is selected in side menu
                        List {
                            BooksContent(books: checkWhichBook())
                        }
                        .listStyle(.plain)
                    }
                }
                .sheet(isPresented: $showingAddView) { AddBooksView() }
                
                SideMenuView(books: books, showingMenuView: $showingMenuView, whichBook: $whichBook)
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
    
    func checkWhichBook() -> [Book] {
        var resultBooks: [Book] = []
        
        for book in books {
            if (book.name == whichBook) {
                resultBooks.append(book)
            } else if (whichBook == "All") {
                resultBooks.append(book)
            }
        }
        
        return resultBooks
    }
    
}
