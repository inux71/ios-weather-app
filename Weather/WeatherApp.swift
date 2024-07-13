//
//  WeatherApp.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WeatherView()
            }
        }
    }
}
