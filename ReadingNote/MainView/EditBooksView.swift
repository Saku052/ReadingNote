//
//  EditBooksView.swift
//  ReadingNote
//
//  Created by Sora Harada on 22/7/2024.
//

import SwiftUI

struct EditBooksView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var book: FetchedResults<Book>.Element
    
    @State private var name: String = ""
    @State private var readingTime: Double = 0
    @State private var addTime: Double = 0
    
    
    var body: some View {
        Form {
            Section("Edit some food") {
                
                TextField("\(book.name!)", text: $name)
                    .onAppear {
                        name = book.name!
                        readingTime = book.readingTime
                    }
                
                VStack {
                    Text("Edit todays reading time: \(Int(readingTime))")
                    Slider(value: $readingTime, in: 0...100, step: 1)
                    Spacer()
                }
                .padding()
                
                VStack {
                    Text("Add reading time: \(Int(addTime))")
                    Slider(value: $addTime, in: 0...100, step: 1)
                    Spacer()
                }
                .padding()
                
                Button("Submit") {
                    readingTime += addTime
                    DataController().editNote(book: book, name: name, readingTime: readingTime, context: managedObjContext)
                    dismiss()
                }
            }
        }
    }
}
