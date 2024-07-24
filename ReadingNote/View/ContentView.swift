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
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("\(Int(totalReadingToday())) minutes of reading today")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                
                List {
                    ForEach(books) { book in
                        NavigationLink(destination: EditBooksView(book: book)) {
                            HStack {
                                VStack (alignment: .leading, spacing: 6){
                                    Text("\(book.name!)")
                                    Text("\(Int(book.readingTime)) minutes")
                                        .bold()
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationTitle("Books")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Book", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
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
