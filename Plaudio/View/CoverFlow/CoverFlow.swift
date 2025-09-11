//
//  CoverFlow.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct CoverFlow: View {
    private let topMargin: CGFloat = 32
    
    var body: some View {
        GeometryReader { geometryProxy in
            let viewWidth = geometryProxy.frame(in: .local).width
            let viewHeight = geometryProxy.frame(in: .local).height
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<100) { index in
                        CoverWithTransition(id: index)
                    }
                }
                .padding(.horizontal, (viewWidth - Cover.size) / 2)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .contentMargins(.bottom, viewHeight - (Cover.size + self.topMargin))
        }
    }
}

#Preview {
    CoverFlow()
}
