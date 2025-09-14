//
//  Cover.swift
//  Plaudio
//
//  Created by Ritwik Dev on 30/08/25.
//

import SwiftUI

struct Cover: View {
    var title: String = "Plaudio"
    
    public private(set) static var SIZE: CGFloat = 175
    
    var body: some View {
        ZStack {
            Text(self.title)
                .padding()
                .foregroundStyle(.white)
                .background(CoverBackground())
                .frame(width: Cover.SIZE * 1, height: Cover.SIZE)
        }
    }
}

#Preview {
    Cover()
}
