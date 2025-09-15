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
    @Entry var deviceDimension: DeviceDimension = .init(dimension: .zero)
}

@Observable
final class Theme {
    var primaryColour: Color;
    
    init(primaryColour: Color) {
        self.primaryColour = primaryColour
    }
}

@Observable
final class DeviceDimension {
    enum DeviceSize {
        case Small
        case Medium
        case Large
    }
    
    let dimension: CGSize;
    let sizeType: DeviceSize;
    
    init(dimension: CGSize) {
        self.dimension = dimension
        self.sizeType = DeviceDimension.calculateSizeType(dimension)
    }
    
    public func isSmall() -> Bool {
        return sizeType == .Small
    }
    
    public func isMedium() -> Bool {
        return sizeType == .Medium
    }
    
    public func isLarge() -> Bool {
        return sizeType == .Large
    }
    
    private static func calculateSizeType(_ dimension: CGSize) -> DeviceSize {
        if dimension.width <= 380 {
            return .Small
        } else if dimension.width <= 420 {
            return .Medium
        } else {
            return .Large
        }
    }
}
