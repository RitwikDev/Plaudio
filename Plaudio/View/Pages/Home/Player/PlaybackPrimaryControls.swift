//
//  PlaybackPrimaryControls.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import SwiftUI

struct PlaybackPrimaryControls: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .opacity(0.1)
            .overlay {
                HStack(spacing: 0) {
                    Button {
                        print("Back")
                    } label: {
                        Circle()
                            .fill(.white)
                            .opacity(0.5)
                            .frame(width: 60)
                            .overlay {
                                Image(systemName: "backward.fill")
                                    .foregroundStyle(.white)
                            }
                    }

                    Spacer()

                    Button {
                        print("Play/Pause")
                    } label: {
                        Circle()
                            .fill(.white)
                            .opacity(0.5)
                            .frame(width: 60)
                            .overlay {
                                Image(systemName: "playpause.fill")
                                    .foregroundStyle(.white)
                            }
                    }

                    Spacer()

                    Button {
                        print("Forward")
                    } label: {
                        Circle()
                            .fill(.white)
                            .opacity(0.5)
                            .frame(width: 60)
                            .overlay {
                                Image(systemName: "forward.fill")
                                    .foregroundStyle(.white)
                            }
                    }
                }
                .padding()
            }
    }
}

#Preview {
    PlaybackPrimaryControls()
}
