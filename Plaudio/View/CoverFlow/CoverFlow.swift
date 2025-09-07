//
//  CoverFlow.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct CoverFlow: View {
    private let coverSpacing: CGFloat = -15

    var body: some View {
        GeometryReader { bodyGeometryProxy in
            let bodyWidth = bodyGeometryProxy.size.width

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    ForEach(0..<100) { index in
                        ZStack {
                            RecordWithTransition()
                            CoverWithTransition(id: index)
                        }
                    }
                }
                .padding(.horizontal, (bodyWidth - Cover.size) / 2)
                .scrollTargetLayout()
                .offset(y: -250)
            }
            .scrollTargetBehavior(.viewAligned)
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    CoverFlow()
}
