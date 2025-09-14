//
//  RecordDragResult.swift
//  Plaudio
//
//  Created by Ritwik Dev on 13/09/25.
//

import Foundation

enum RecordOverlappingFeature {
    case None
    case Queue
    case Player
}

class RecordDragRequest {
    let recordPositionY: CGFloat
    let queueRect: CGRect
    let playerRect: CGRect
    
    init(recordPositionY: CGFloat, queueRect: CGRect, playerRect: CGRect) {
        self.recordPositionY = recordPositionY
        self.queueRect = queueRect
        self.playerRect = playerRect
    }
}

class RecordDragResult {
    let currentOverlappingFeature: RecordOverlappingFeature
    let offsetFromCentre: CGFloat
    
    init(currentOverlappingFeature: RecordOverlappingFeature, offsetFromCentre: CGFloat) {
        self.currentOverlappingFeature = currentOverlappingFeature
        self.offsetFromCentre = offsetFromCentre
    }
}
