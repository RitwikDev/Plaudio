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
                offsetFromCentre: calculateNormalisedDistanceFromOrigin(
                    recordPositionY: request.recordPositionY,
                    rect: request.queueRect
                )
            )
        }
        
        if isIntersectingWithPlayer(request: request) {
            return RecordDragResult(
                currentOverlappingFeature: RecordOverlappingFeature.Player,
                offsetFromCentre: calculateNormalisedDistanceFromOrigin(
                    recordPositionY: request.recordPositionY,
                    rect: request.playerRect
                )
            )
        }
        
        return RecordDragResult(
            currentOverlappingFeature: RecordOverlappingFeature.None,
            offsetFromCentre: 0
        )
    }
    
    private static func isIntersectingWithQueue(request: RecordDragRequest) -> Bool {
        return request.recordPositionY >= request.queueRect.minY && request.recordPositionY <= request.queueRect.maxY
    }
    
    private static func isIntersectingWithPlayer(request: RecordDragRequest) -> Bool {
        return request.recordPositionY >= request.playerRect.minY && request.recordPositionY <= request.playerRect.maxY
    }
    
    private static func calculateNormalisedDistanceFromOrigin(recordPositionY: CGFloat, rect: CGRect) -> CGFloat {
        return 1 - abs(recordPositionY - rect.midY) / (rect.height / 2)
    }
}
