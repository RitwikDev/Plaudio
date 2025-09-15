//
//  SearchPage.swift
//  Plaudio
//
//  Created by Ritwik Dev on 07/09/25.
//

import SwiftUI

struct SearchPage: View {
    @State private var searchText: String = ""
    @State private var showCancelButton: Bool = false
    @State private var shouldFocusSearch: Bool = false
        
    var body: some View {
        VStack {
            SearchBar(searchText: self.$searchText, shouldFocusSearch: self.$shouldFocusSearch)
                .padding(.horizontal, 15)
                .padding(.top, 15)
                .onGeometryChange(for: Bool.self) { proxy in
                    proxy.frame(in: .global).origin.x == 0
                } action: { newValue in
                    if newValue {
                        self.shouldFocusSearch = true
                    }
                }

            List(1..<101, id: \.self) { index in
                Text("Plaudio \(index)")
                    .listRowBackground(Color.clear)
            }
            .scrollDismissesKeyboard(.immediately)
            .scrollContentBackground(.hidden)
            .simultaneousGesture(
                DragGesture()
                    .onChanged {_ in
                        self.shouldFocusSearch = false
                    }
            )
        }
    }
}

#Preview {
    SearchPage()
        .preferredColorScheme(.dark)
}
