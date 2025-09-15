//
//  TrackCollection.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation

struct TrackCollection {
    public let tracks: [Track]
    
    public static func empty() -> Self {
        return .init(tracks: [])
    }
    
    public func isEmpty() -> Bool {
        return tracks.isEmpty
    }
}
