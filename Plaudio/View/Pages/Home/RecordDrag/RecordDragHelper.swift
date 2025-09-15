//
//  RecordDragHelper.swift
//  Plaudio
//
//  Created by Ritwik Dev on 13/09/25.
//

import Foundation

class RecordDragHelper {
    public static func getDragResult(request: RecordDragRequest) -> RecordDragResult {
        if isIntersectingWithQueue(request: request) {
            return RecordDragResult(
                currentOverlappingFeature: RecordOverlappingFeature.Queue,
                offsetFromCentre: calculateNormalisedDistanceFromOrigin1D(
                    recordPosition: request.recordPosition,
                    rect: request.queueRect
                )
            )
        }
        
        if isIntersectingWithTurntable(request: request) {
            return RecordDragResult(
                currentOverlappingFeature: RecordOverlappingFeature.Turntable,
                offsetFromCentre: calculateNormalisedDistanceFromOrigin2D(
                    recordPosition: request.recordPosition,
                    rect: request.turntableRect
                )
            )
        }
        
        if isIntersectingWithTrackInfo(request: request) {
            return RecordDragResult(
                currentOverlappingFeature: RecordOverlappingFeature.TrackInfo,
                offsetFromCentre: calculateNormalisedDistanceFromOrigin2D(
                    recordPosition: request.recordPosition,
                    rect: request.trackInfoRect
                )
            )
        }
        
        return RecordDragResult(
            currentOverlappingFeature: RecordOverlappingFeature.None,
            offsetFromCentre: 0
        )
    }
    
    private static func isIntersectingWithQueue(request: RecordDragRequest) -> Bool {
        return request.recordPosition.y >= request.queueRect.minY
        && request.recordPosition.y <= request.queueRect.maxY
    }
    
    private static func isIntersectingWithTurntable(request: RecordDragRequest) -> Bool {
        return request.recordPosition.y >= request.turntableRect.minY
        && request.recordPosition.y <= request.turntableRect.maxY
        && request.recordPosition.x >= request.turntableRect.minX
        && request.recordPosition.x <= request.turntableRect.maxX
    }
    
    private static func isIntersectingWithTrackInfo(request: RecordDragRequest) -> Bool {
        return request.recordPosition.y >= request.trackInfoRect.minY
        && request.recordPosition.y <= request.trackInfoRect.maxY
        && request.recordPosition.x >= request.trackInfoRect.minX
        && request.recordPosition.x <= request.trackInfoRect.maxX
    }
    
    private static func calculateNormalisedDistanceFromOrigin1D(recordPosition: CGPoint, rect: CGRect) -> CGFloat {
        return 1 - abs(recordPosition.y - rect.midY) / (rect.height / 2)
    }
    
    private static func calculateNormalisedDistanceFromOrigin2D(recordPosition: CGPoint, rect: CGRect) -> CGFloat {
        let distance = sqrt(pow(recordPosition.x - rect.midX, 2) + pow(recordPosition.y - rect.midY, 2))
        let diagonalLength = sqrt(pow(rect.width, 2) + pow(rect.height, 2))
        let normalised = distance / (diagonalLength / 2)
        
        return 1 - normalised
    }
}
