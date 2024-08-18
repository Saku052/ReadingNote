//
//  PieChartView.swift
//  ReadingNote
//
//  Created by Sora Harada on 18/8/2024.
//

import SwiftUI
import Charts

struct PieChartView: View {
    let books: [Book]
    
    var body: some View {
    
        Chart(books, id: \.name) { data in
            SectorMark(angle: .value("Value", data.readingTime),
                       innerRadius: .ratio(0.6), angularInset: 1.5)
            .foregroundStyle(by: .value("book names", data.name!))
        }
        .frame(height: 200)
        .padding()
        
        Spacer()
    }
}
