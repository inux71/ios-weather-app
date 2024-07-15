//
//  WeatherApp.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    @AppStorage("darkTheme") private var darkTheme: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WeatherView()
                    .preferredColorScheme(darkTheme ? .dark : .light)
            }
        }
    }
}
