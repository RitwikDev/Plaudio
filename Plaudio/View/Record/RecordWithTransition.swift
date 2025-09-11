//
//  RecordWithTransition.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct RecordWithTransition: View {
    @State var recordOffset: CGSize = .zero
    
    public var id: Int = 0
    private let recordPeekOffsetY: CGFloat = 90
    
    var body: some View {
        Record()
            .id(self.id)
            .offset(self.recordOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.handleRecordDragged(value: value)
                    }
                    .onEnded{ value in
                        self.handleRecordDragEnded(value: value)
                    }
            )
            .scrollTransition(.animated.threshold(.visible(1))) { content, phase in
                content
                    .offset(y: phase.isIdentity ? self.recordPeekOffsetY : 0)
                    .scaleEffect(phase.isIdentity ? 1 : 0)
                    .rotation3DEffect(
                        .degrees(phase.isIdentity ? 0 : min(-150 * phase.value, 180)),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
    }
    
    func handleRecordDragged(value: DragGesture.Value) {
        let newWidth = Maths.clamp(value: value.translation.width, minimum: -20, maximum: 20);
        let newHeight = Maths.clamp(value: value.translation.height, minimum: 0, maximum: value.translation.height);
        let newSize: CGSize = CGSize(width: newWidth, height: newHeight);
        
        print(value.location.y)

        withAnimation(.spring) {
            self.recordOffset = newSize
        }
    }
    
    func handleRecordDragEnded(value: DragGesture.Value) {
        withAnimation(.spring) {
            self.recordOffset = .zero
        }
    }
}

#Preview {
    RecordWithTransition()
}
