//
//  PlaybackSecondaryControls.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import SwiftUI

struct PlaybackSecondaryControls: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .opacity(0.1)
            .overlay {
                HStack(spacing: 0) {
                    Button {
                        print("Shuffle")
                    } label: {
                        Circle()
                            .fill(.white)
                            .opacity(0.5)
                            .frame(width: 60)
                            .overlay {
                                Image(systemName: "shuffle")
                                    .foregroundStyle(.white)
                            }
                    }

                    Spacer()

                    Button {
                        print("Loop")
                    } label: {
                        Circle()
                            .fill(.white)
                            .opacity(0.5)
                            .frame(width: 60)
                            .overlay {
                                Image(systemName: "repeat")
                                    .foregroundStyle(.white)
                            }
                    }
                }
                .padding()
            }
    }
}

#Preview {
    PlaybackSecondaryControls()
}
