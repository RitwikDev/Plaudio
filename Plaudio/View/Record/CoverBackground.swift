//
//  CoverBackground.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct CoverBackground: View {
    @Environment(\.theme) var theme: Theme
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [
                        self.theme.primaryColour,
                        self.theme.primaryColour.adjust(brightness: -0.5)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: Cover.size, height: Cover.size)
            .shadow(color: .black, radius: 50, x: 0, y: 30)
    }
}

#Preview {
    CoverBackground()
}
