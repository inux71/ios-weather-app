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
            Image(systemName: viewModel.getWeatherImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
            
            Text(String(format: "%.1f℃", viewModel.weatherInfo.current.temperature))
                 .font(.system(size: 64))
            
            Text(viewModel.getWeatherDescription())
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
            viewModel.initDataFromUserDefaults()
        }
    }
}

#Preview {
    WeatherView()
}
