//
//  DummyLocations.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

#if DEBUG
import Foundation
import CoreLocationClient

public enum DummyLocations {
    case tokyo
    case yokohama
    case hokkaido
    case okinawa
    case mizonokuchi
    case matsue

    var location: Location {
        switch self {
        case .tokyo:
            Location(rawValue: CLLocation(latitude: 35.6812, longitude: 139.7671))
        case .yokohama:
            Location(rawValue: CLLocation(latitude: 35.4437, longitude: 139.6380))
        case .hokkaido:
            Location(rawValue: CLLocation(latitude: 43.2203, longitude: 142.8635))
        case .okinawa:
            Location(rawValue: CLLocation(latitude: 26.3344, longitude: 127.8056))
        case .mizonokuchi:
            Location(rawValue: CLLocation(latitude: 35.6034, longitude: 139.6121))
        case .matsue:
            Location(rawValue: CLLocation(latitude: 34.4682, longitude: 133.0484))
        }
    }
}
#endif
