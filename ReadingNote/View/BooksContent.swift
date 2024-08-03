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
        
        ForEach(books) { book in
            NavigationLink(destination: EditBooksView(book: book)) {
                HStack {
                    VStack (alignment: .leading, spacing: 6){
                        Text("\(book.name!)")
                        Text("\(Int(book.readingTime)) minutes")
                            .bold()
                    }
                    Spacer()
                    
                    Text("\(book.readDate!.formatted(date: .numeric, time: .omitted))")
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
    
    func sumBooks(books: FetchedResults<Book>) -> [bookData]{
        
        var groupBooks: [bookData] = []
        var dateNow: Date = Date()
        
        for book in books {
            
            if(dateNow == book.readDate) {
            }
            
            dateNow = book.readDate!
        }
        
        return groupBooks
    }
    
}

struct bookData {
    
    var name: String
    var readDate: Date
    var readingTime: Double
}
