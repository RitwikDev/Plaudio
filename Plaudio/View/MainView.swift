//
//  MainView.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct MainView: View {
    @Environment(\.theme) var theme
    
    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient(
                colors: [
                    self.theme.primaryColour,
                    .black,
                ],
                startPoint: .bottom,
                endPoint: .top
            )
            
            CoverFlow()
        }
    }
}

#Preview {
    MainView()
}
