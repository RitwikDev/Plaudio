//
//  Record.swift
//  Plaudio
//
//  Created by Ritwik Dev on 30/08/25.
//

import SwiftUI

struct Record: View {
    var centerColour: Color = .yellow
    let backgroundColour: Color = Color(red: 0.23, green: 0.23, blue: 0.23)
    
    var body: some View {
        ZStack {
            Ring(colour: self.backgroundColour, lineWidth: 70)
            Ring(lineWidth: 0.5, radius: 80)
            Ring(lineWidth: 0.5, radius: 70)
            Ring(lineWidth: 0.5, radius: 55)
            Ring(colour: self.centerColour, lineWidth: 15, radius: 40)
        }
        .shadow(color: .black, radius: 30, x: 0, y: -30)
    }
}

#Preview {
    Record(centerColour: .blue)
}
