//
//  Queue.swift
//  Plaudio
//
//  Created by Ritwik Dev on 02/09/25.
//

import SwiftUI

struct Queue: View {
    public static let NUMBER_OF_RECORDS: CGFloat = 7
    public static let DEFAULT_SPACING: CGFloat = -50
    public static let DEFAULT_ANGLE: CGFloat = 45
    
    @Binding public var spacing: CGFloat
    @Binding public var angle: CGFloat
    
    private let recordCenterColours: [Color] = [
        .yellow,
        .red,
        .green,
        .blue,
        .white,
        .purple,
    ]

    var body: some View {
        HStack(spacing: self.spacing) {
            ForEach(0..<Int(Queue.NUMBER_OF_RECORDS), id: \.self) { index in
                Record(
                    centreColour: self.recordCenterColours[index % recordCenterColours.count]
                )
                .rotation3DEffect(
                    Angle.degrees(self.angle),
                    axis: (x: 0, y: 1, z: 0)
                )
            }
        }
    }
}

#Preview {
    Queue(spacing: .constant(Queue.DEFAULT_SPACING), angle: .constant(Queue.DEFAULT_ANGLE))
}
