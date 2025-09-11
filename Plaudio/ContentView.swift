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
        NavigationView {
            MainView()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Plaudio")
                            .font(.custom("Remarcle", size: 21))
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            print("Selecting folder")
                        } label: {
                            Label("Select folder", systemImage: "folder")
                        }

                    }
                }
                .environment(\.theme, Theme(primaryColour: selectedColour))
                .ignoresSafeArea(.keyboard)
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
