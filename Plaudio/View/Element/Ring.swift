//
//  Ring.swift
//  Plaudio
//
//  Created by Ritwik Dev on 30/08/25.
//

import SwiftUI

struct Ring: View {
    var colour: Color = .black
    var lineWidth: CGFloat = 1
    public private(set) var radius: CGFloat = 100

    var body: some View {
        Circle()
            .strokeBorder(self.colour, lineWidth: self.lineWidth)
            .frame(width: self.radius)
    }
}

#Preview {
    Ring()
}
