//
//  Track.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation
import SwiftData
import SwiftUICore

@Model
class Track: Identifiable {
    public private(set) var id: Int
    public private(set) var title: String
    public private(set) var url: URL
    
    init(id: Int, title: String, url: URL) {
        self.id = id
        self.title = title
        self.url = url
    }
    
    public static func empty() -> Track {
        return .init(id: 0, title: "", url: URL(fileURLWithPath: ""))
    }
}
