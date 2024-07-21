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
    @State private var readTime: Double = 0
    
    var body: some View {
        
        Form {
            Section(header: Text("Add Books")) {
                
                TextField("Add new book", text: $name)
                
                VStack {
                    Text("reading Time: \(Int(readTime))")
                    Slider(value: $readTime, in: 0...1000, step: 50)
                    Spacer()
                }
                .padding()
                
                Button("Submit") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddBooksView()
}
