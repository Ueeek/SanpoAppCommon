//
//  Angle.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import Foundation

public struct Angle: Hashable {
    public static var zero: Angle {
        return Angle(0)
    }

    public var value: Double

    public init(_ value: Double) {
        self.value = value
    }

    public var isZero: Bool {
        return value == 0
    }
}
