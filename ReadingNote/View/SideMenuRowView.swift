//
//  SideMenuRowView.swift
//  ReadingNote
//
//  Created by Sora Harada on 14/8/2024.
//

import SwiftUI

struct SideMenuRowView: View {
    var bookName: String
    
    var body: some View {
        HStack {
            Image(systemName: "book")
                .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
            Text(bookName)
                .font(.subheadline)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SideMenuRowView(bookName: "hi")
}
