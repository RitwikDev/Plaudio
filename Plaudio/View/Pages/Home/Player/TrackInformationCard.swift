//
//  TrackInformationCard.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import SwiftUI

struct TrackInformationCard: View {    
    @State public var title: String = ""
    @State public var artist: String = ""
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .opacity(0.1)
            .overlay(
                VStack(alignment: .leading, spacing: 0) {
                    Text(self.title)
                        .foregroundStyle(.white)
                        .font(.title3)
                        .padding()
                    
                    
                    Text(self.artist)
                        .foregroundStyle(.white)
                        .padding()
                        .padding(.bottom, 20)
                }
            )
    }
}

#Preview {
    TrackInformationCard(title: "Plaudio music player demo", artist: "Kishore Kumar")
}
