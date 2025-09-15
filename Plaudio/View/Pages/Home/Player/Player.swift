//
//  Player.swift
//  Plaudio
//
//  Created by Ritwik Dev on 02/09/25.
//

import SwiftUI

struct Player: View {
    @State public var isPlaying: Bool = false

    @Binding public var turnableRect: CGRect
    @Binding public var trackInfoRect: CGRect

    var body: some View {
        VStack(spacing: 0) {
            ProgressView()
                .progressViewStyle(.linear)
                .padding()

            HStack(spacing: 0) {
                Turntable(isPlaying: self.$isPlaying, turnableRect: self.$turnableRect)
                    .padding(.leading)

                GeometryReader { geometry in
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
                    .onAppear {
                        self.trackInfoRect = geometry.frame(in: .global)
                    }
                }
                .padding()
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    Player(
        turnableRect: .constant(.init(x: 100, y: 100, width: 100, height: 100)),
        trackInfoRect: .constant(.init(x: 100, y: 100, width: 100, height: 100))
    )
}
