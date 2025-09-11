//
//  HideKeyboard.swift
//  Plaudio
//
//  Created by Ritwik Dev on 08/09/25.
//

import Foundation
import SwiftUICore
import UIKit

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
