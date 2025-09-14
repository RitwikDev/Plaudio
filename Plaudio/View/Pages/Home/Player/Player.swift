//
//  Player.swift
//  Plaudio
//
//  Created by Ritwik Dev on 02/09/25.
//

import SwiftUI

struct Player: View {
    @State public var isPlaying: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            Color.white.frame(height: 50)

            HStack(spacing: 0) {
                TurnTable(isPlaying: self.$isPlaying)
                    .padding(.leading)

                TabView {
                    TrackInformationCard(
                        title: "Plaudio demo track 1 with an extremely long name",
                        artist: "Kishore Kumar"
                    )
                    .tabItem { Label("Info", systemImage: "music.note.list") }

                    PlaybackPrimaryControls()
                        .tabItem { Label("Primary Controls", systemImage: "playpause.fill") }

                    PlaybackSecondaryControls()
                        .tabItem { Label("Secondary Controls", systemImage: "shuffle") }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                .padding()
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    Player()
}
