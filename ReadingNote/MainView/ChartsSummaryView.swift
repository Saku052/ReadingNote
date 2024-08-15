//
//  ChartsSummaryView.swift
//  ReadingNote
//
//  Created by Sora Harada on 5/8/2024.
//

import SwiftUI

struct ChartsSummaryView: View {
    
    let books: [Book]
    
    var body: some View {
        
        List {
            VStack {
                Text("reading time frequency")
                    .bold()
                HistogramView(books: books)
                    .padding()
                    .frame(height: 200)
            }
            
            VStack {
                Text("reading time trend")
                    .bold()
                TrendGraphView(books: books)
                    .padding()
                    .frame(height: 200)
            }
        }
    }
}
