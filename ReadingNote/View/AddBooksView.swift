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
    @State private var calories: Double = 0
    
    var body: some View {
        
        Form {
            Section(header: Text("Add Books")) {
                
                TextField("Add food here", text: $name)
                
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 50)
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
