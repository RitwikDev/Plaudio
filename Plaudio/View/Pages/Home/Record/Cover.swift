//
//  Cover.swift
//  Plaudio
//
//  Created by Ritwik Dev on 30/08/25.
//

import SwiftUI

struct Cover: View {
    @Environment(\.deviceDimension) var deviceDimension: DeviceDimension
    
    @State public var size: CGFloat
    
    public var title: String

    var body: some View {
        ZStack {
            Text(self.title)
                .padding()
                .foregroundStyle(.white)
                .background(CoverBackground(size: self.size))
                .frame(width: self.size * 1, height: self.size)
        }
    }
}

#Preview {
    Cover(size: 175, title: "Plaudio")
}
