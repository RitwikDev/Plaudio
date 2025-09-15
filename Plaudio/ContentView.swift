//
//  ContentView.swift
//  Plaudio
//
//  Created by Ritwik Dev on 30/08/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var selectedColour: Color = .cyan
    @State private var showFileImporter: Bool = false
    @State private var showAlert: Bool = false
    @State private var errorMessage: String = ""
    @State private var trackCollection: TrackCollection = TrackCollection.empty()

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                MainView(trackCollection: self.$trackCollection)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Plaudio")
                                .font(.custom("Remarcle", size: 21))
                        }

                        ToolbarItem(placement: .confirmationAction) {
                            Button {
                                self.showFileImporter = true
                            } label: {
                                Label(
                                    "Select folder",
                                    systemImage: "folder.fill"
                                )
                            }
                        }

                        ToolbarItem(placement: .confirmationAction) {
                            Button {
                                let _ = PlaudioDirectoryService.shared.trySaveDirectory(directory: URL(fileURLWithPath: ""))
                                self.trackCollection = .empty()
                            } label: {
                                Label(
                                    "Clear directory",
                                    systemImage: "trash"
                                )
                            }
                        }
                    }
                    .environment(\.theme, Theme(primaryColour: selectedColour))
                    .environment(\.deviceDimension, DeviceDimension(dimension: geometry.size))
                    .ignoresSafeArea(.keyboard)
                    .preferredColorScheme(.dark)
            }
        }
        .onAppear(perform: loadTracks)
        .fileImporter(
            isPresented: self.$showFileImporter,
            allowedContentTypes: [.folder]
        ) { result in
            self.handleFolderSelected(result)
        }
        .alert(self.errorMessage, isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
    }

    private func handleFolderSelected(_ result: Result<URL, any Error>) {
        let openResult = FileImporterService.shared.tryOpenFolder(result: result)
        if openResult.isOk {
            let trackCollection = ReadTrackService.shared.tryRead(openResult.plaudioDirectory)
            self.trackCollection = trackCollection
        } else {
            self.errorMessage = openResult.errorMessage
            self.showAlert = true
        }
    }

    private func loadTracks() {
        if let directory = PlaudioDirectoryService.shared.tryLoadDirectory() {
            if directory.isEmpty() {
                return
            }
            
            self.trackCollection = ReadTrackService.shared.tryRead(directory)
        }
    }
}

#Preview {
    ContentView()
}
