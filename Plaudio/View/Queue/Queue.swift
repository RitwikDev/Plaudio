//
//  Queue.swift
//  Plaudio
//
//  Created by Ritwik Dev on 02/09/25.
//

import SwiftUI

struct Queue: View {
    private let recordCenterColours: [Color] = [
        .yellow,
        .red,
        .green,
        .blue,
        .white,
    ]
    
    var body: some View {
        HStack(spacing: -70) {
            ForEach(0..<10) { _ in
                Record(centerColour: self.recordCenterColours.randomElement() ?? .yellow)
                    .rotation3DEffect(
                        Angle.degrees(45),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
        }
    }
}

#Preview {
    Queue()
}
