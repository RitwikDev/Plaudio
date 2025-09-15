//
//  CoverFlow.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct CoverFlow: View {
    @Binding public var currentRecordId: Int
    @Binding public var scrollPhase: ScrollPhase
    @Binding public var trackCollection: TrackCollection
    
    public var coverSize: CGFloat = 150
    
    var body: some View {
        VStack {
            GeometryReader { geometryProxy in
                let viewWidth = geometryProxy.frame(in: .local).width
                
                VStack {
                    ScrollViewReader { scrollViewReaderProxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(self.trackCollection.tracks) { track in
                                    CoverWithTransition(track: track, size: self.coverSize)
                                }
                                .containerRelativeFrame(.vertical, alignment: .bottom)
                            }
                            .padding(.horizontal, (viewWidth - self.coverSize) * 0.5)
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .onScrollPhaseChange { oldPhase, newPhase in
                            self.scrollPhase = newPhase
                        }
                        .onScrollTargetVisibilityChange(idType: Int.self, threshold: 100) { ids in
                            self.currentRecordId = ids.first ?? 0
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CoverFlow(
        currentRecordId: .constant(0),
        scrollPhase: .constant(.idle),
        trackCollection: .constant(.empty())
    )
}
