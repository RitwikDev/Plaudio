//
//  CoverWithTransition.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct CoverWithTransition: View {
    var id: Int = 0
    
    var body: some View {
        Cover(title: "Plaudio \(id)")
            .id(self.id)
            .scrollTransition() { content, phase in
                content
                    .scaleEffect(phase.isIdentity ? 1 : 0.2)
                    .rotation3DEffect(
                        .degrees(phase.isIdentity ? 0 : min(-150 * phase.value, 180)),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
    }
}

#Preview {
    CoverWithTransition(id: 1)
}
