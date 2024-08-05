//
//  ChartsSummaryView.swift
//  ReadingNote
//
//  Created by Sora Harada on 5/8/2024.
//

import SwiftUI

struct ChartsSummaryView: View {
    
    let books: FetchedResults<Book>
    
    var body: some View {
        
        VStack {
            Text("This is my histogram")
                .bold()
            HistogramView(books: books)
                .padding()
                .frame(height: 200)
            Spacer()
        }
    }
}
