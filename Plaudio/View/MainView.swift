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
        GeometryReader { geometryProxy in
            let bodyHeight = geometryProxy.frame(in: .global).height
            let bodyWidth = geometryProxy.frame(in: .global).width
            
            ZStack(alignment: .top) {
                LinearGradient(
                    colors: [
                        self.theme.primaryColour,
                        .black,
                    ],
                    startPoint: .bottom,
                    endPoint: .top
                )
                
                VStack {
                    Queue()
                    Player()
                }
                .padding(.bottom, 0)
                .overlay {
                    CoverFlow()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
