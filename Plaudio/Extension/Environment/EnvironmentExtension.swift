//
//  EnvironmentExtension.swift
//  Plaudio
//
//  Created by Ritwik Dev on 31/08/25.
//

import Foundation
import SwiftUICore

extension EnvironmentValues {
    @Entry var theme: Theme = .init(primaryColour: .red)
}

@Observable
final class Theme {
    var primaryColour: Color;
    
    init(primaryColour: Color) {
        self.primaryColour = primaryColour
    }
}
