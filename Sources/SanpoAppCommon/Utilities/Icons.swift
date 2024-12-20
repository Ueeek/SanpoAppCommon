//
//  Icons.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import Foundation

public enum LocationIcon: Codable, Sendable, CaseIterable {
    case home
    case pin
    case store
    case car
    case school
    case sports

    public var name: String {
        switch self {
        case .home:
            "house.fill"
        case .pin:
            "pin.fill"
        case .store:
            "cart.fill"
        case .car:
            "car.fill"
        case .school:
            "graduationcap.fill"
        case .sports:
            "soccerball"
        }
    }
}
