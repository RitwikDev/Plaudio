//
//  ContentView.swift
//  Plaudio
//
//  Created by Ritwik Dev on 30/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColour: Color = .red

    var body: some View {
        VStack {
            MainView()
                .environment(\.theme, Theme(primaryColour: selectedColour))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
