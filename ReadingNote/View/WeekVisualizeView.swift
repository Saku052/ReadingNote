//
//  WeekVisualizeView.swift
//  ReadingNote
//
//  Created by Sora Harada on 21/8/2024.
//

import SwiftUI

struct WeekVisualizeView: View {
    
    
    let colorBlue: Color = Color(red: 0.13, green: 1, blue: 0.95)
    let colorGreen: Color = Color(red: 0.58, green: 0.83, blue: 0.42)
    
    var body: some View {
        
        HStack (alignment: .center, spacing: 10) {
            Spacer()
            DayCircle(dayLetter: "M", statusColor: colorGreen)
            DayCircle(dayLetter: "T", statusColor: colorGreen)
            DayCircle(dayLetter: "W", statusColor: colorGreen)
            DayCircle(dayLetter: "T", statusColor: colorGreen)
            DayCircle(dayLetter: "F", statusColor: colorGreen)
            DayCircle(dayLetter: "S", statusColor: colorGreen)
            DayCircle(dayLetter: "S", statusColor: colorGreen)
            Spacer()
        }

        HStack (alignment: .center, spacing: 10) {
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 20)
                .background(
                    LinearGradient(gradient: Gradient(colors: [colorBlue, colorGreen]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(8)
            Spacer()
        }
    }
}

#Preview {
    WeekVisualizeView()
}
