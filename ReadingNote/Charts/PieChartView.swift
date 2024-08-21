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
    
        Chart(getBookGroup(), id: \.name) { data in
            SectorMark(angle: .value("Value", data.time),
                       innerRadius: .ratio(0.6), angularInset: 1.5)
            .foregroundStyle(by: .value("Category", data.name))
            .cornerRadius(5)
        }
        .chartLegend(position: .top)
        .frame(height: 200)
        .padding()
        
        Spacer()
    }
    
    func getBookGroup() -> [bookTime] {
        
        var timePerBook: [bookTime] = []
        
        for book in books {
            if let index = timePerBook.firstIndex(where: { $0.name == book.name }) {
                timePerBook[index].time += book.readingTime
            } else {
                timePerBook.append(bookTime(name: book.name!, time: book.readingTime))
            }
        }
        return timePerBook
    }
}

struct bookTime: Equatable {
    
    var name: String
    var time: Double
}
