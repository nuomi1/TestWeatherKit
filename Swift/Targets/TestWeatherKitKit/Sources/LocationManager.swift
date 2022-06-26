//
//  LocationManager.swift
//  TestWeatherKit
//
//  Created by nuomi1 on 2022/6/12.
//

import CoreLocation
import Foundation

// MARK: - LocationManager

public class LocationManager: ObservableObject {

    private let locationManager = CLLocationManager()
    private var coordinator: Coordinator!

    @Published
    public var location: CLLocation?

    public init() {
        coordinator = Coordinator(self)
        locationManager.delegate = coordinator
    }

    public func requestLocation() {
        locationManager.requestLocation()
    }
}

extension LocationManager {

    private class Coordinator: NSObject, CLLocationManagerDelegate {

        weak var parent: LocationManager?

        init(_ parent: LocationManager) {
            self.parent = parent
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }

            DispatchQueue.main.async { [unowned self] in
                self.parent?.location = location
            }
        }

        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }
    }
}
