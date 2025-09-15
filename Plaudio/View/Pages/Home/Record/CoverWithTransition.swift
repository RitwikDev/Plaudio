//
//  CoverWithTransition.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct CoverWithTransition: View {
    public var track: Track
    public var size: CGFloat = 150
    
    var body: some View {
        ZStack() {
            Cover(size: self.size, title: self.track.title)
        }
        .id(self.track.id)
        .scrollTransition() { content, phase in
            content
                .scaleEffect(phase.isIdentity ? 1 : 0.8)
                .rotation3DEffect(
                    .degrees(phase.isIdentity ? 0 : min(-90 * phase.value, 90)),
                    axis: (x: 0, y: 1, z: 0)
                )
        }
    }
}

#Preview {
    CoverWithTransition(track: .empty())
}
