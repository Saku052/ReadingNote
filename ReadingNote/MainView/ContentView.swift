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
                    if (whichBook == "All") {
                        
                        // Top Bar showing day of the week
                        WeekVisualizeView()
                        
                        // middle histogram box
                        ZStack (alignment: .bottom) {
                            Rectangle()
                                .cornerRadius(10.0)
                                .foregroundStyle(Color(red: 0.93, green: 0.93, blue: 0.93))
                            HistogramView(books: checkWhichBook())
                                .padding(30.0)
                            StreakCircleView()
                                .offset(y: 50)
                        }
                        .padding(20.0)
                        
                        // bottom What you learned box
                        ZStack (alignment: .center) {
                            Rectangle()
                                .cornerRadius(10.0)
                                .foregroundStyle(Color(red: 0.93, green: 0.93, blue: 0.93))
                            Text("This is what I have learned This day")
                                .foregroundStyle(Color.black)
                        }
                        .padding(.vertical, 20)
                        .padding(20)
                    
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
                ToolbarItem(placement: .bottomBar) {
                    HStack (alignment: .center) {
                        Spacer()
                        Button { showingMenuView.toggle() }
                        label: { Image(systemName: "line.3.horizontal") }
                        Spacer()
                        Spacer()
                        Button { showingAddView.toggle() }
                        label: { Label("Book", systemImage: "plus.circle") }
                        Spacer()
                    }
                    .foregroundStyle(Color.white)
                }
            }
            .background(Color(red: 0.25, green: 0.21, blue: 0.26));
        }
        .navigationViewStyle(.stack)

    }
    
    func totalReadingToday() -> Double {
        var readingToday: Double = 0
        for item in books {
            if Calendar.current.isDate(item.readDate!, equalTo: Date(), toGranularity: .weekOfYear){
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
