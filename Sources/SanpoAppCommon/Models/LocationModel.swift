//
//  LocationModel.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import CoreLocationClient

struct LocationModel: Codable, Equatable, Sendable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var icon: LocationIcon
    var location: Location

    mutating func updateIcon(_ icon: LocationIcon) {
        self.icon = icon
    }

    mutating func updateName(_ name: String) {
        self.name = name
    }
}
