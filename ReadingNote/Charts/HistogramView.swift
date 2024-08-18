//
//  ChartsView.swift
//  ReadingNote
//
//  Created by Sora Harada on 5/8/2024.
//

import SwiftUI
import Charts

struct HistogramView: View {
    
    let books: [Book]
    
    var body: some View {
        let dataset = books.map { $0.readingTime }

        Chart {
            ForEach (getfrequency(data: dataset)) { data in
                BarMark(x: .value("reading time", String(data.split) + "~"),
                        y: .value("frequency", data.freq))
            }
        }
    }
    
    func getfrequency(data: [Double]) -> [FrequencyData] {
        
        var freqData: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
        var splitArray: [Int] = []
        let range: Double = data.max()! - data.min()!
        let splitnum: Double = range / 8
        
        for i in 0...7 {
            splitArray.append(Int(data.min()! + splitnum*Double(i)))
        }
        
        for item in data {
            for i in 0...7 {
                if (Int(item) < splitArray[i]) {
                    
                    freqData[i] += 1
                    break
                }
            }
        }
        
        return zip(splitArray, freqData).map { FrequencyData(split: $0, freq: $1) }
    }
}

struct FrequencyData: Identifiable {
    let id = UUID()
    let split: Int
    let freq: Int
}

