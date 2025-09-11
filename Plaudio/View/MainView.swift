//
//  MainView.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

import SwiftUI

struct MainView: View {
    private enum Tabs{
        case Search
        case Home
        case Queue
    }
    
    @Environment(\.theme) var theme
    
    @State private var tabSelection: Tabs = Tabs.Home
    @State private var backgroundGradientColours: [Color] = [.black]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: self.backgroundGradientColours,
                startPoint: .top,
                endPoint: .bottom
            )
                .clipShape(.rect(cornerRadius: 10))
            
            TabView(selection: $tabSelection) {
                SearchPage()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(Tabs.Search)
                
                Homepage()
                    .tabItem {
                        Label("Play", systemImage: "waveform")
                    }
                    .tag(Tabs.Home)
                
                Text("Queue")
                    .tabItem {
                        Label("Queue", systemImage: "text.append")
                    }
                    .tag(Tabs.Queue)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .onChange(of: self.tabSelection) { oldValue, newValue in
                withAnimation(.linear(duration: 2)) {
                    self.backgroundGradientColours = newValue == Tabs.Search
                    ? [.black, self.theme.primaryColour.adjust(brightness: -0.5), .black]
                    : [self.theme.primaryColour, .black]
                }
            }
            .onAppear {
                self.backgroundGradientColours = [self.theme.primaryColour, .black]
            }
        }
    }
}

#Preview {
    MainView()
}
