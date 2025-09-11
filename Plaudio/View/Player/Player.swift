//
//  Player.swift
//  Plaudio
//
//  Created by Ritwik Dev on 02/09/25.
//

import SwiftUI

struct Player: View {
    var body: some View {
        Rectangle()
            .fill(.indigo)
            .opacity(0.3)
            .overlay {
                Text("Player")
            }
    }
}

#Preview {
    Player()
}
