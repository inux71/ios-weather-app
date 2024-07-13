//
//  WeatherView.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Weather View")
        }
        .navigationTitle("Gliwice")
        .toolbar {
            NavigationLink(destination: SelectCityView()) {
                Image(systemName: "magnifyingglass")
            }
            
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
            }
        }
    }
}

#Preview {
    WeatherView()
}
