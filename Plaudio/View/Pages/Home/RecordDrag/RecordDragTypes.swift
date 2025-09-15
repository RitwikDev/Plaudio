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
    case Turntable
    case TrackInfo
}

class RecordDragRequest {
    let recordPosition: CGPoint
    let queueRect: CGRect
    let turntableRect: CGRect
    let trackInfoRect: CGRect
    
    init(recordPosition: CGPoint, queueRect: CGRect, turntableRect: CGRect, trackInfoRect: CGRect) {
        self.recordPosition = recordPosition
        self.queueRect = queueRect
        self.turntableRect = turntableRect
        self.trackInfoRect = trackInfoRect
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
