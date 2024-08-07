//
//  AddBooksView.swift
//  ReadingNote
//
//  Created by Sora Harada on 21/7/2024.
//

import SwiftUI

struct AddBooksView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var readTime: Double = 0.0
    
    var body: some View {
        
        Form {
            Section(header: Text("Add Books")) {
                
                TextField("Add new book", text: $name)
                
                VStack {
                    Text("reading Time: \(Int(readTime))")
                    Slider(value: $readTime, in: 0...100, step: 1)
                    Spacer()
                }
                .padding()
                
                VStack (spacing: 10) {
                    Spacer()
                    HStack (alignment: .center) {
                        Spacer()
                        StopWatchView(minuteCount: $readTime)
                        Spacer()
                    }
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addNote(name: name, readingTime: readTime, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddBooksView()
}
