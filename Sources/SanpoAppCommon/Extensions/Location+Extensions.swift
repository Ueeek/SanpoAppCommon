//
//  Location+Extensions.swift
//  SanpoApp
//
//  Created by KoichiroUeki on 2024/11/30.
//
import CoreLocationClient

extension Location {
    var coordinate2D: CLLocation {
        CLLocation(latitude: self.coordinate.latitude, longitude: self.coordinate.longitude)
    }

    func distance(to location: Location) -> Distance {
        let toCLLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let value = coordinate2D.distance(from: toCLLocation)
        return Distance(value) ?? .zero
    }

    func distance(to location: CLLocationCoordinate2D) -> Distance {
        let value = coordinate2D.distance(from: CLLocation(latitude: location.latitude, longitude: location.longitude))
        return Distance(value) ?? .zero
    }

    func calculateBearing(to destinationLocation: Location) -> Angle {
        let current = self.coordinate
        let destination = destinationLocation.coordinate
        let phi1 = current.latitude * .pi / 180
        let phi2 = destination.latitude * .pi / 180
        let delta = (destination.longitude - current.longitude) * .pi / 180

        // swiftlint:disable:next identifier_name
        let y = sin(delta) * cos(phi2)
        // swiftlint:disable:next identifier_name
        let x = cos(phi1) * sin(phi2) -
            sin(phi1) * cos(phi2) * cos(delta)
        let bearing = atan2(y, x)
        let value = (bearing * 180 / .pi + 360).truncatingRemainder(dividingBy: 360) // 0-360度に変換
        return Angle(value) ?? .zero
    }
}
