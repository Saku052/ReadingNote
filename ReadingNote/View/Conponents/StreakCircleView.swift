//
//  StreakCircleView.swift
//  ReadingNote
//
//  Created by Sora Harada on 29/8/2024.
//

import SwiftUI

struct StreakCircleView: View {
    var body: some View {
        ZStack (alignment: .top){
            Circle()
                .foregroundStyle(Color(red: 0.29, green: 0.94, blue: 0.76))
                .frame(width: 75, height: 75)
                .overlay(
                    Circle()
                        .inset(by: 2.5)
                        .stroke(Color(red: 0.93, green: 0.93, blue: 0.93), lineWidth: 5.0)
                )
            
            VStack {
                Text("Streak")
                    .bold()
                
                Text("6")
                    .bold()
                    .font(.system(size: 32))
            }
            
        }
    }
}

#Preview {
    StreakCircleView()
}
