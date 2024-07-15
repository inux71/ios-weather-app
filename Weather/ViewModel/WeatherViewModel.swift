//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let userDefaultsRepository: UserDefaultsRepository = UserDefaultsRepository()
    
    @Published var cityName: String = ""
    
    func readCityNameFromUserDefaults() {
        cityName = userDefaultsRepository.readString(forKey: "name", defaultValue: "")
    }
}
