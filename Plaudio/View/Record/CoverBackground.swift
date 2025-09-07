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
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(
                    colors: [
                        self.theme.primaryColour,
                        self.theme.primaryColour.adjust(brightness: -0.7)
                    ],
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .frame(width: Cover.size, height: Cover.size)
            .shadow(color: .black, radius: 50, x: 0, y: -10)
    }
}

#Preview {
    CoverBackground()
}
