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
                Text(" minutes of reading today")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                
                List {
                    ForEach(books) { book in
                        NavigationLink(destination: Text("\(book.readingTime)")) {
                            HStack {
                                VStack (alignment: .leading, spacing: 6){
                                    Text("\(book.name!)")
                                    Text("\(Int(book.readingTime)) kcal")
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
        }
        .navigationViewStyle(.stack)
    }
    
}

#Preview {
    ContentView()
}
