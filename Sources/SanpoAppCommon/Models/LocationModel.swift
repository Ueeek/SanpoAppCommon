//
//  LocationModel.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import CoreLocationClient

public struct LocationModel: Codable, Equatable, Sendable, Hashable, Identifiable {
    public var id: UUID
    public var name: String
    public var icon: LocationIcon
    public var location: Location
    
    public init(id: UUID, name: String, icon: LocationIcon, location: Location) {
        self.id = id
        self.name = name
        self.icon = icon
        self.location = location
    }
    
    public mutating func updateIcon(_ icon: LocationIcon) {
        self.icon = icon
    }
    
    public mutating func updateName(_ name: String) {
        self.name = name
    }
}
