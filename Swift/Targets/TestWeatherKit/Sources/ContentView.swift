//
//  ContentView.swift
//  TestWeatherKit
//
//  Created by nuomi1 on 2022/6/11.
//

import CoreLocationUI
import Foundation
import SwiftUI
import TestWeatherKitKit

// MARK: - ContentView

struct ContentView: View {

    @StateObject
    private var locationManager = LocationManager()

    @StateObject
    private var weatherManager = WeatherManager()

    var body: some View {
        List {
            if let location = locationManager.location {
                let content = "Location: \(location)"
                Text(content)
            }

            if let alerts = weatherManager.alerts {
                let content = "Alerts: \(alerts)"
                Text(content)
            }

            if let current = weatherManager.current {
                let content = "Current: \(current)"
                Text(content)
            }

            if let daily = weatherManager.daily {
                let content = "Daily: \(daily)"
                Text(content)
            }

            if let hourly = weatherManager.hourly {
                let content = "Hourly: \(hourly)"
                Text(content)
            }

            if let minute = weatherManager.minute {
                let content = "Minute: \(minute)"
                Text(content)
            }

            if let availability = weatherManager.availability {
                let content = "Availability: \(availability)"
                Text(content)
            }

            HStack(alignment: .center) {
                Spacer()

                LocationButton(.currentLocation) {
                    locationManager.requestLocation()
                }
                .frame(height: 40)
                .cornerRadius(20)
                .foregroundColor(.white)

                Spacer()
            }
        }
        .onChange(of: locationManager.location) { newValue in
            if let location = newValue {
                weatherManager.weather(for: location)
            }
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
