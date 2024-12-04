//
//  Angle.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import Foundation

struct Angle: Hashable {
    static var zero: Angle {
        return Angle(0)
    }

    var value: Double

    init(_ value: Double) {
        self.value = value
    }

    var isZero: Bool {
        return value == 0
    }
}
