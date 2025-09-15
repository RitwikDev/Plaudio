//
//  FileImporterService.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation

class FileImporterService {
    public static let shared = FileImporterService()
    
    private init() {}
    
    public func tryOpenFolder(result: Result<URL, any Error>) -> OpenFolderResult {
        switch result {
        case .success(let directory):
            if let plaudioDirectory = PlaudioDirectoryService.shared.trySaveDirectory(directory: directory) {
                return OpenFolderResult.success(plaudioDirectory: plaudioDirectory)
            }
            return OpenFolderResult.failure("Folder could not be opened. Reason: Failed to save directory.")
        case .failure(let error):
            return OpenFolderResult.failure("Folder could not be opened. Reason: \(error)")
        }
    }
}
