//
//  Turntable.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import SwiftUI

struct Turntable: View {
    @Binding public var isPlaying: Bool
    @Binding public var turnableRect: CGRect

    var body: some View {
        ZStack(alignment: .topLeading) {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 10)
                    .fill(.brown)
                    .overlay(
                        alignment: .bottom,
                        content: {
                            Record(centreColour: .mint)
                                .frame(height: Record.SIZE)
                        }
                    )
                    .onAppear {
                        self.turnableRect = geometry.frame(in: .global)
                    }
            }
            .frame(width: Record.SIZE * 1.2, height: Record.SIZE * 1.35)

            Arm
                .rotationEffect(.degrees(self.isPlaying ? 10 : -12), anchor: .leading)
                .padding(8)
                .padding(.leading, 16)
        }
        .shadow(radius: 10)
        .onTapGesture {
            withAnimation(.spring(duration: 1)) {
                self.isPlaying = !self.isPlaying
            }
        }
    }

    var Arm: some View {
        ZStack(alignment: .leading) {
            ZStack {
                Circle()
                    .fill(.black)
                    .frame(width: Record.SIZE / 3)

                Circle()
                    .fill(.white)
                    .frame(width: Record.SIZE / 6)
            }
            .padding(.leading, -Record.SIZE / 6)

            HStack(spacing: 0) {
                UnevenRoundedRectangle(topLeadingRadius: 5, bottomLeadingRadius: 5)
                    .fill(.black)
                    .frame(width: Record.SIZE * 0.4, height: 5)

                UnevenRoundedRectangle(bottomTrailingRadius: 5, topTrailingRadius: 5)
                    .fill(.black)
                    .frame(width: Record.SIZE * 0.4, height: 5)
                    .rotationEffect(.degrees(45), anchor: .leading)
                    .padding(.leading, -1)
            }
            .shadow(radius: 2.5, y: 5)
        }
    }
}

#Preview {
    Turntable(
        isPlaying: .constant(false),
        turnableRect: .constant(.init(x: 100, y: 100, width: 100, height: 100))
    )
}
