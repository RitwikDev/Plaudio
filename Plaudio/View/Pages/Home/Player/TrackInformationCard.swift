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
                VStack(alignment: .leading) {
                    Text(self.title)
                        .foregroundStyle(.white)
                        .padding()
                    
                    Spacer()
                    
                    Text(self.artist)
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding(.horizontal)
                        .padding(.bottom, 28)
                        .padding(.top, 0)
                }
            )
    }
}

#Preview {
    TrackInformationCard(title: "Plaudio music player demo", artist: "Kishore Kumar")
}
