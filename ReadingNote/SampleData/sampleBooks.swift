//
//  sampleBooks.swift
//  ReadingNote
//
//  Created by Sora Harada on 16/8/2024.
//

import Foundation

class sampleBooks: ObservableObject {
    
    @Published var randomBooks: [Book] = []
    
    func AddBooks(bookName: String) -> Book {
        let book1: Book = Book()
        
        book1.id = UUID()
        book1.name = bookName
        book1.readDate = Date()
        book1.readingTime = Double.random(in: 5..<15)
        
        return book1
    }
    
    init() {
        for booknum in 1...5 {
            
            randomBooks.append(AddBooks(bookName: "Book\(booknum)"))
        }
    }
}
