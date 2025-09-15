//
//  PlaudioDir.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation
import SwiftData

class PlaudioDirectory: Codable {
    public static let KEY = "PLAUDIO_DIRECTORY"
    
    public private(set) var directory: URL
    
    init(directory: URL) {
        self.directory = directory
    }
    
    public func isEmpty() -> Bool {
        return directory.path == ""
    }
    
    public static func empty() -> PlaudioDirectory {
        return PlaudioDirectory(directory: URL(fileURLWithPath: ""))
    }
}
