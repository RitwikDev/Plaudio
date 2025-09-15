//
//  PlaudioDirectoryService.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation

class PlaudioDirectoryService {
    public static let shared = PlaudioDirectoryService()

    private init() {}

    public func trySaveDirectory(directory: URL) -> PlaudioDirectory? {
        let plaudioDirectory = PlaudioDirectory(directory: directory)
        
        if let encoded = try? JSONEncoder().encode(plaudioDirectory) {
            UserDefaults.standard.set(encoded, forKey: PlaudioDirectory.KEY)
            return plaudioDirectory
        }
        
        return nil
    }

    public func tryLoadDirectory() -> PlaudioDirectory? {
        if let data = UserDefaults.standard.data(forKey: PlaudioDirectory.KEY) {
            if let decoded = try? JSONDecoder().decode(PlaudioDirectory.self, from: data) {
                return decoded
            }
        }

        return nil
    }
}
