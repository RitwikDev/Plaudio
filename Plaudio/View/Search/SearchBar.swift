//
//  SearchBar.swift
//  Plaudio
//
//  Created by Ritwik Dev on 09/09/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding public var searchText: String
    @Binding public var shouldFocusSearch: Bool
    
    @State private var showCancelButton: Bool = false
    @FocusState private var isSearchInFocus: Bool
    
    private let animationDuration: Double = 0.1
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                    .padding(.leading, 5)

                TextField("", text: $searchText, prompt: Text("Search").foregroundStyle(.gray))
                    .foregroundStyle(.black)
                    .focused($isSearchInFocus, equals: self.shouldFocusSearch)
                    .autocorrectionDisabled()

                if !self.searchText.isEmpty {
                    Image(systemName: "xmark.circle.fill")
                        .onTapGesture {
                            self.searchText = ""
                        }
                        .foregroundStyle(.gray)
                        .padding(.trailing, 5)
                }
            }
            .padding(5)
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))

            if self.showCancelButton {
                Button {
                    self.isSearchInFocus = false
                } label: {
                    Text("Cancel")
                }
                .buttonStyle(.plain)
                .foregroundStyle(.blue)
                .transition(.opacity)
            }
        }
        .onChange(of: self.isSearchInFocus) { oldValue, newValue in
            let cancelButtonAnimationDuration = newValue ? self.animationDuration / 2 : self.animationDuration * 2
            withAnimation(.easeInOut(duration: cancelButtonAnimationDuration)) {
                self.showCancelButton = newValue
            }
        }
        .onChange(of: self.shouldFocusSearch, { oldValue, newValue in
            self.isSearchInFocus = newValue
        })
        .animation(
            .easeInOut(duration: self.animationDuration),
            value: self.isSearchInFocus
        )
    }
}

#Preview {
    SearchBar(searchText: .constant(""), shouldFocusSearch: .constant(true))
}
