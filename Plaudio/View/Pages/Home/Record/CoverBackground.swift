//
//  CoverBackground.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct CoverBackground: View {
    @Environment(\.theme) var theme: Theme
    
    public var size: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [
                        self.theme.primaryColour.adjust(brightness: -0.2),
                        self.theme.primaryColour.adjust(brightness: -0.7)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: self.size, height: self.size)
    }
}

#Preview {
    CoverBackground(size: 175)
}
