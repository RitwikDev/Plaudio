//
//  ColourExtension.swift
//  Plaudio
//
//  Created by Ritwik Dev on 30/08/25.
//

import Foundation
import SwiftUICore
import UIKit

extension Color {
    func adjust(
        hue: CGFloat = 0,
        saturation: CGFloat = 0,
        brightness: CGFloat = 0,
        opacity: CGFloat = 1
    ) -> Color {
        let colour = UIColor(self)
        var currentHue: CGFloat = 0
        var currentSaturation: CGFloat = 0
        var currentBrightness: CGFloat = 0
        var currentOpacity: CGFloat = 0

        let gotHueSuccessfully = colour.getHue(
            &currentHue,
            saturation: &currentSaturation,
            brightness: &currentBrightness,
            alpha: &currentOpacity
        )

        if gotHueSuccessfully {
            return Color(
                hue: currentHue + hue,
                saturation: currentSaturation + saturation,
                brightness: currentBrightness + brightness,
                opacity: currentOpacity + opacity
            )
        }

        return self
    }
    
    static func random() -> Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
