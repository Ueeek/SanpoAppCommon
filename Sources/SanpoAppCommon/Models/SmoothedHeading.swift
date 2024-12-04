//
//  SmoothedHeading.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/12/01.
//

import Foundation
import CoreLocationClient

public struct SmoothedHeading: Equatable {
    public var magneticHeading: Double
}

public extension SmoothedHeading {
    func headingSmoother(new: SmoothedHeading) -> SmoothedHeading {
        return self._headingSmoother(new: new)
    }
}

private extension SmoothedHeading {
    // new: from Heading, [0, 360)
    // swiftlint:disable:next identifier_name
    func _headingSmoother(new: SmoothedHeading) -> SmoothedHeading {
        let aRound: Double = 360

        let currentValue = self.magneticHeading
        let newValue = new.magneticHeading
        assert(newValue >= 0, "newValue >0")
        assert(newValue < aRound, "newValue < 360")

        // [0, 360)
        let truncateCurrentValue: Double = {
            var value = currentValue.truncatingRemainder(dividingBy: aRound)
            if value < 0 {
                value += aRound
            }
            return value
        }()
        assert(truncateCurrentValue >= 0, "truncateCurrentValue >= 0")
        assert(truncateCurrentValue < aRound, "truncateCurrentValue < 360")

        let diff = newValue - truncateCurrentValue
        assert(diff > -aRound, "diff > -360")
        assert(diff < aRound, "diff < 360")

        let arrangedDiff = if diff > 0 {
            diff > 180 ? diff - aRound: diff
        } else {
            diff < -180 ? 360 + diff: diff
        }

        let smoothedValue = currentValue + arrangedDiff
        return SmoothedHeading(magneticHeading: smoothedValue)
    }
}
