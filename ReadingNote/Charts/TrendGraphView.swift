//
//  TrendGraphView.swift
//  ReadingNote
//
//  Created by Sora Harada on 6/8/2024.
//

import SwiftUI
import Charts

struct TrendGraphView: View {
    
    let books: [Book]
    
    var body: some View {
        
        Chart {
            ForEach (books.prefix(10)) { data in
                BarMark(x: .value("date", data.readDate!),
                        y: .value("freq", data.readingTime))
            }
        }
    }
}
