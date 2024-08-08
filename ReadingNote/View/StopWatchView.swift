//
//  StopWatchView.swift
//  ReadingNote
//
//  Created by Sora Harada on 6/8/2024.
//

import SwiftUI

struct StopWatchView: View {
    
    @Binding var minuteCount: Double
    @State var secondCount: Double = 0.0
    @State var isTimerCounting: Bool = false
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack (spacing: 40) {
            
            Text(timerDisplay(seconds: secondCount))
                .font(.system(size:60))
                .bold()
                .frame(width: 200, height: 200)
                .background(Circle().fill(Color.white)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .onReceive(self.timer) { time in
                    if (isTimerCounting) {
                        
                        secondCount += 0.1
                    }
                }
            
            HStack (spacing: 20) {
                
                Image(systemName: "gobackward.60")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        secondCount -= 60
                    }
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                        isTimerCounting = true
                    }
                
                Image(systemName: "pause.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        self.timer.upstream.connect().cancel()
                        isTimerCounting = false
                    }
                
                Image(systemName: "goforward.60")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .onTapGesture {
                        secondCount += 60
                    }
            }
        }
    }
    
    func timerDisplay(seconds: Double) -> String {

        var second: Int
        
        if (seconds < 60) {
            
            return String(format: "%.1f", seconds)
        } else {
            minuteCount = floor(seconds/60)
            second = Int(seconds) % 60
            
            return String("\(Int(minuteCount)) : \(second)s")
        }
        
    }
}

