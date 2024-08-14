//
//  SideMenuView.swift
//  ReadingNote
//
//  Created by Sora Harada on 14/8/2024.
//

import SwiftUI

struct SideMenuView: View {
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
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(.white)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    SideMenuView(showingMenuView: .constant(true))
}
