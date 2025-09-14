//
//  TurnTable.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import SwiftUI

struct TurnTable: View {
    @Binding public var isPlaying: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.brown)
                .overlay(
                    alignment: .bottom,
                    content: {
                        Record(centreColour: .mint)
                            .frame(height: Record.SIZE)
                    }
                )
                .frame(width: Record.SIZE * 1.2, height: Record.SIZE * 1.35)
            
            Arm
                .rotationEffect(.degrees(self.isPlaying ? 10 : -12), anchor: .leading)
                .padding(8)
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
            
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.black)
                    .frame(width: Record.SIZE / 2, height: 5)

                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .frame(width: Record.SIZE / 2, height: 5)
                    .rotationEffect(.degrees(45), anchor: .leading)
                    .padding(.leading, -1)
            }
        }
    }
}

#Preview {
    TurnTable(isPlaying: .constant(false))
}
