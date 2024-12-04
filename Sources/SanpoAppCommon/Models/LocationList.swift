//
//  LocationList.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import Foundation

enum LocationListError: Error {
    case failToRemove
    case notFound
}

struct LocationList: Codable, Equatable, Sendable {
    #if DEBUG
    mutating func mockList() {
        self.locations = [
            LocationModel(id: UUID(), name: "Tokyo", icon: .home, location: DummyLocations.tokyo.location),
            LocationModel(id: UUID(), name: "Yokohama", icon: .home, location: DummyLocations.yokohama.location),
            LocationModel(id: UUID(), name: "Okinawa", icon: .home, location: DummyLocations.okinawa.location),
            LocationModel(id: UUID(), name: "Hokkaido", icon: .home, location: DummyLocations.hokkaido.location),
            LocationModel(id: UUID(), name: "Mizonokuchi", icon: .home, location: DummyLocations.mizonokuchi.location),
            LocationModel(id: UUID(), name: "Mastue", icon: .home, location: DummyLocations.matsue.location)
        ]
    }
    #endif
    private(set) var locations: [LocationModel] = []
    mutating func append(item: LocationModel) {
        locations.append(item)
    }

    mutating func removeItem(index: Int) throws {
        guard index < locations.count else {
            throw LocationListError.failToRemove
        }
        locations.remove(at: index)
    }

    mutating func removeItem(item: LocationModel) throws {
        guard let index = locations.firstIndex(where: { $0.id == item.id }) else {
            throw LocationListError.notFound
        }
        locations.remove(at: index)
    }

    // Replace item of same `uuid` with new Item
    mutating func replace(newItem: LocationModel) throws {
        guard let index = locations.firstIndex(where: { $0.id == newItem.id }) else {
            throw LocationListError.notFound
        }
        locations.remove(at: index)
        locations.append(newItem)
    }

    mutating func removeAll() throws {
        locations.removeAll()
    }
}
