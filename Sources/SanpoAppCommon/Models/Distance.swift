//
//  Distance.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import Foundation

public struct Distance {
    public static var zero: Self {
        return Distance(0)!
    }

    public var value: Double

    public init?(_ value: Double) {
        //        guard value >= 0 else { return nil }
        self.value = value
    }

    public var shortMeters: String {
        let intValue = Int(value.rounded())
        if intValue < 1000 {
            return String(intValue) + "m"
        } else if intValue < 1000000 {
            return String(intValue/1000) + "km"
        } else {
            return "Too far"
        }
    }
}
