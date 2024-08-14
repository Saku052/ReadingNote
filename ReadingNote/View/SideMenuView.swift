//
//  SideMenuView.swift
//  ReadingNote
//
//  Created by Sora Harada on 14/8/2024.
//

import SwiftUI

struct SideMenuView: View {
    var books: FetchedResults<Book>
    @Binding var showingMenuView: Bool
    
    var body: some View {
        ZStack {
            if showingMenuView {
                
                // Background gray color part
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { showingMenuView.toggle() }
                
                // White side menu part
                HStack {
                    VStack {
                        Text("This is header")
                        
                        ForEach (listOfBooks(), id: \.self) { book in
                            SideMenuRowView(bookName: book)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: showingMenuView)
    }
    
    func listOfBooks() -> [String] {
        
        var booklist: [String] = []
        for book in books {
            if (!booklist.contains(book.name!)) {
                booklist.append(book.name!)
            }
        }
        
        return booklist
    }
}
