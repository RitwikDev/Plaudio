//
//  Maths.swift
//  Plaudio
//
//  Created by Ritwik Dev on 01/09/25.
//

class Maths
{
    public static func clamp<T: Comparable>(value: T, minimum: T, maximum: T) -> T
    {
        return value < minimum ? minimum : (value > maximum ? maximum : value);
    }
}
