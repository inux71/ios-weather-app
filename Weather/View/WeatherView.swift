//
//  WeatherView.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Weather View")
        }
        .navigationTitle(viewModel.cityName)
        .toolbar {
            NavigationLink(destination: SelectCityView()) {
                Image(systemName: "magnifyingglass")
            }
            
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
            }
        }
        .onAppear {
            viewModel.readCityNameFromUserDefaults()
        }
    }
}

#Preview {
    WeatherView()
}
