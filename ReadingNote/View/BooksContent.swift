//
//  BooksContent.swift
//  ReadingNote
//
//  Created by Sora Harada on 2/8/2024.
//

import SwiftUI

struct BooksContent: View {
    
    let books: FetchedResults<Book>
    @Environment(\.managedObjectContext) var managedObjContext
    
    var body: some View {
        
        NavigationLink (destination: ChartsSummaryView(books: books)) {
            VStack (alignment: .leading) {
                
                Text("Check distribution")
                Text("Average: 20 minutes")
                    .bold()
            }
        }
        
        // List of past 8 books read
        ForEach(books.prefix(8)) { book in
            NavigationLink(destination: EditBooksView(book: book)) {
                HStack {
                    VStack (alignment: .leading, spacing: 6) {
                        Text("\(book.name!)")
                        Text("\(Int(book.readingTime)) minutes")
                            .bold()
                    }
                    Spacer()
                    
                    Text("\(book.readDate!.formatted(date: .numeric, time: .omitted))")
                        .foregroundStyle(getForegroundStyle(for: book.readDate!))
                }
            }
            
            
        }
        .onDelete(perform: deleteBooks)
    }
    
    func deleteBooks(offsets: IndexSet) {
        withAnimation {
            offsets.map { books[$0] }.forEach(managedObjContext.delete)
            DataController().save(context: managedObjContext)
        }
    }
    
    func getForegroundStyle(for date: Date?) -> any ShapeStyle {
        guard let date = date else {
            return .primary
        }
        
        let formattedReadDate = date.formatted(date: .numeric, time: .omitted)
        let formattedCurrentDate = Date().formatted(date: .numeric, time: .omitted)
        
        return formattedReadDate != formattedCurrentDate ? .gray : .primary
    }
}
