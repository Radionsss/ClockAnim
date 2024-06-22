//
//  ContentView.swift
//  ClockAnim
//
//  Created by Radion Kufeld on 21.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var timer: CGFloat = 0
    @State private var count: Int = 0
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 10) {
                    FlipClockTextEffect(
                        value: .constant(count / 10 % 6),
                        size: CGSize(
                            width: 100,
                            height: 150
                        ),
                        fontSize: 90,
                        cornerRadius: 20,
                        foreground: .black,
                        background: .white
                    )
                    
                    FlipClockTextEffect(
                        value: .constant(count % 10),
                        size: CGSize(
                            width: 100,
                            height: 150
                        ),
                        fontSize: 90,
                        cornerRadius: 20,
                        foreground: .black,
                        background: .white
                    )
                }
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
                    timer += 1
                    if timer >= 60 {
                        SharedPreferences.shared.saveTime(SharedPreferences.shared.getTime()+1)
                        timer = 0
                    }
                    count = Int(timer)
                })
                
                Text("Your time \(String(describing: SharedPreferences.shared.getTime()))")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .padding(.top, 10)
            }
            .padding()
            .navigationTitle("Flip Clock Effect")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
