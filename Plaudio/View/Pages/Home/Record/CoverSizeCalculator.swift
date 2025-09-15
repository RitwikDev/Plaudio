//
//  CoverSizeCalculator.swift
//  Plaudio
//
//  Created by Ritwik Dev on 14/09/25.
//

import Foundation

class CoverSizeCalculator {
    public static func calculate(_ deviceDimension: DeviceDimension) -> CGFloat {
        return deviceDimension.dimension.width * 0.43
    }
}
