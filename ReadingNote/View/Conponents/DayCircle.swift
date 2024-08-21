//
//  DayCircle.swift
//  ReadingNote
//
//  Created by Sora Harada on 21/8/2024.
//

import SwiftUI

struct DayCircle: View {
    
    let dayLetter: String
    var statusColor: Color
    
    var body: some View {
        ZStack() {
          Circle()
                .foregroundColor(statusColor)
          Text(dayLetter)
                .font(Font.custom("Roboto", size: 25))
                .foregroundColor(.black)
        }
    }
}
