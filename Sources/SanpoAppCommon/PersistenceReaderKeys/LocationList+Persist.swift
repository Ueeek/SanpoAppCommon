//
//  LocationList+Persist.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//

import ComposableArchitecture

extension PersistenceReaderKey where Self == FileStorageKey<LocationList> {
    static var locations: Self {
        fileStorage(.documentsDirectory.appending(component: "locations.json"))
    }
}
