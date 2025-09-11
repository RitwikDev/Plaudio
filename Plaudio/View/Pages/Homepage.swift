//
//  Homepage.swift
//  Plaudio
//
//  Created by Ritwik Dev on 07/09/25.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        ZStack {
            GeometryReader { geometryProxy in
                let bodyHeight = geometryProxy.frame(in: .local).height
                
                VStack {
                    Queue()
                    Player()
                }
                .frame(height: bodyHeight * 0.7)
                .containerRelativeFrame(.vertical, alignment: .bottom)

                CoverFlow()
            }
        }
        .onAppear {
            hideKeyboard()
        }
    }
}

#Preview {
    Homepage()
}
