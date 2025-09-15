//
//  ReadTrackService.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation
import SwiftUICore

class ReadTrackService {
    public static let shared: ReadTrackService = ReadTrackService()

    private init() {}

    public func tryRead(_ plaudioDirectory: PlaudioDirectory) -> TrackCollection {
        let directory = plaudioDirectory.directory
        let gotAccess = directory.startAccessingSecurityScopedResource()

        if !gotAccess {
            return TrackCollection.empty()
        }

        let resourceKeys = self.getResourceKeys()
        let directoryEnumerator = self.getDirectoryEnumerator(directory: directory, resourceKeys: resourceKeys)
        let trackCollection = self.getTrackCollection(
            directoryEnumerator: directoryEnumerator,
            resourceKeys: resourceKeys
        )

        directory.stopAccessingSecurityScopedResource()

        return trackCollection
    }

    private func getResourceKeys() -> Set<URLResourceKey> {
        return Set<URLResourceKey>([
            .isDirectoryKey,
            .documentIdentifierKey,
            .localizedNameKey,
        ])
    }

    private func getDirectoryEnumerator(
        directory: URL,
        resourceKeys: Set<URLResourceKey>
    ) -> FileManager.DirectoryEnumerator {
        return FileManager.default.enumerator(
            at: directory,
            includingPropertiesForKeys: Array(resourceKeys),
            options: .skipsHiddenFiles
        )!
    }

    private func getTrackCollection(
        directoryEnumerator: FileManager.DirectoryEnumerator,
        resourceKeys: Set<URLResourceKey>
    ) -> TrackCollection {
        var tracks: [Track] = []

        for case let fileURL as URL in directoryEnumerator {
            guard let resourceValues = try? fileURL.resourceValues(forKeys: resourceKeys),
                let isDirectory = resourceValues.isDirectory,
                let id = resourceValues.documentIdentifier,
                let localizedName = resourceValues.localizedName
            else {
                continue
            }
            
            if isDirectory {
                continue
            }
            
            tracks.append(Track(id: id, title: localizedName, url: fileURL.absoluteURL))
        }

        return TrackCollection(tracks: tracks)
    }
}
