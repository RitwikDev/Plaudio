//
//  OpenFolderResult.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation

struct OpenFolderResult {
    public let isOk: Bool
    public let plaudioDirectory: PlaudioDirectory
    public let errorMessage: String
    
    private init(isOk: Bool, plaudioDirectory: PlaudioDirectory, errorMessage: String) {
        self.isOk = isOk
        self.plaudioDirectory = plaudioDirectory
        self.errorMessage = errorMessage
    }
    
    public static func success(plaudioDirectory: PlaudioDirectory) -> OpenFolderResult {
        .init(isOk: true, plaudioDirectory: plaudioDirectory, errorMessage: "")
    }
    
    public static func failure(_ errorMessage: String) -> OpenFolderResult {
        .init(isOk: false, plaudioDirectory: .empty(), errorMessage: errorMessage)
    }
}
