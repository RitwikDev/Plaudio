//
//  Homepage.swift
//  Plaudio
//
//  Created by Ritwik Dev on 07/09/25.
//

import SwiftUI

struct Homepage: View {
    @State private var bodyRect: CGRect = .zero
    @State private var coverFlowRect: CGRect = .zero
    @State private var queueRect: CGRect = .zero
    @State private var playerRect: CGRect = .zero

    @State private var recordOpacity: CGFloat = 1
    @State private var recordOffset: CGPoint = .zero
    @State private var recordDragGlobalPosition: CGPoint = .zero

    @State public var currentRecordId: Int = 0
    @State public var scrollPhase: ScrollPhase = .idle
    
    @State private var queueSpacing: CGFloat = Queue.DEFAULT_SPACING
    @State private var queueAngle: CGFloat = Queue.DEFAULT_ANGLE
    @State private var queueOffsetX: CGFloat = 0

    private let coverFlowFramePadding: CGFloat = 16
    private let recordDragLimitX: CGFloat = 100

    var body: some View {
        VStack {
            GeometryReader { bodyGeometry in
                VStack(spacing: 50) {
                    CoverFlowView
                    ZStack(alignment: .center) {
                        QueueAndPlayerView
                        RecordView
                    }
                }
                .onChange(of: self.scrollPhase) { oldValue, newValue in
                    if newValue == .idle {
                        self.showRecord()
                    } else {
                        self.hideRecord()
                    }
                }
                .onAppear {
                    self.bodyRect = bodyGeometry.frame(in: .global)
                }
            }
        }
    }

    var CoverFlowView: some View {
        GeometryReader { coverFlowGeometry in
            CoverFlow(
                currentRecordId: self.$currentRecordId,
                scrollPhase: self.$scrollPhase
            )
            .onAppear {
                self.coverFlowRect = coverFlowGeometry.frame(in: .global)
            }
        }
        .frame(height: Cover.SIZE + self.coverFlowFramePadding)
        .zIndex(2)
        .shadow(color: .black, radius: 30, x: 0, y: 15)
    }

    var QueueAndPlayerView: some View {
        VStack(spacing: 0) {
            GeometryReader { queueGeometry in
                Queue(spacing: self.$queueSpacing, angle: self.$queueAngle)
                    .frame(maxWidth: .infinity)
                    .offset(x: self.queueOffsetX)
                    .onAppear {
                        self.queueRect = queueGeometry.frame(in: .global)
                    }
            }

            GeometryReader { playerGeometry in
                Player()
                    .onAppear {
                        self.playerRect = playerGeometry.frame(in: .global)
                    }
            }
        }
    }

    var RecordView: some View {
        Record()
            .offset(x: self.recordOffset.x, y: self.recordOffset.y)
            .opacity(self.recordOpacity)
            .frame(maxWidth: .infinity)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.handleRecordDragged(value: value, hasEnded: false)
                    }
                    .onEnded { value in
                        self.handleRecordDragged(value: value, hasEnded: true)
                    }
            )
            .simultaneousGesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged { value in
                        handleRecordDraggedInGlobalCoordinate(value: value, hasEnded: false)
                    }
                    .onEnded { value in
                        handleRecordDraggedInGlobalCoordinate(value: value, hasEnded: true)
                    }
            )
            .onChange(of: self.coverFlowRect) { oldValue, newValue in
                self.resetRecordOffset(resetRect: newValue)
            }
    }

    private func handleRecordDragged(value: DragGesture.Value, hasEnded: Bool) {
        let normalisedValueX = (value.location.x / (self.bodyRect.width / 2)) - 1

        let newX = Maths.clamp(
            value: self.recordDragLimitX * normalisedValueX,
            minimum: -self.recordDragLimitX,
            maximum: self.recordDragLimitX
        )
        
        let adjustedNewY = value.location.y
        + (Record.SIZE / 2)
        - (self.coverFlowRect.origin.y + self.coverFlowRect.height)
        
        let newY = Maths.clamp(
            value: adjustedNewY,
            minimum: -(self.coverFlowRect.origin.y + self.coverFlowRect.height + self.coverFlowFramePadding),
            maximum: self.bodyRect.height
        )
        

        withAnimation(.spring(duration: 0.5)) {
            if hasEnded {
                self.resetRecordOffset(resetRect: self.coverFlowRect)
            } else {
                self.recordOffset = CGPoint(x: newX, y: newY)
            }
        }
    }
    
    private func handleRecordDraggedInGlobalCoordinate(value: DragGesture.Value, hasEnded: Bool) {
        let result = RecordDragHelper.getDragResult(
            request: RecordDragRequest(
                recordPositionY: value.location.y,
                queueRect: self.queueRect,
                playerRect: self.playerRect
            )
        )
        
        withAnimation {
            if result.currentOverlappingFeature == .Queue {
                let newSpacing = -30 * (1 - result.offsetFromCentre)
                let newAngle = 30 * (1 - result.offsetFromCentre)
                self.queueSpacing = newSpacing
                self.queueAngle = newAngle
                
                let newQueueWidth = ((90 - newAngle) / 90) * Record.SIZE * Queue.NUMBER_OF_RECORDS
                self.queueOffsetX = (self.bodyRect.width - newQueueWidth) / 2
            }
            
            if hasEnded || result.currentOverlappingFeature != .Queue {
                self.queueSpacing = Queue.DEFAULT_SPACING
                self.queueAngle = Queue.DEFAULT_ANGLE
                self.queueOffsetX = 0
            }
        }
    }

    private func resetRecordOffset(resetRect: CGRect) {
        withAnimation(.spring(duration: 0.5)) {
            self.recordOffset = CGPoint(
                x: 0,
                y: -(resetRect.origin.y + resetRect.height + self.coverFlowFramePadding)
            )
        }
    }

    private func showRecord() {
        withAnimation(.spring(duration: 0.25)) {
            self.recordOpacity = 1
            self.resetRecordOffset(resetRect: self.coverFlowRect)
        }
    }

    private func hideRecord() {
        withAnimation(.spring(duration: 0.1)) {
            self.recordOffset = CGPoint(
                x: 0,
                y: -(self.coverFlowRect.origin.y + self.coverFlowRect.height + Record.SIZE)
            )
            self.recordOpacity = 0
        }
    }
}

#Preview {
    Homepage()
}
