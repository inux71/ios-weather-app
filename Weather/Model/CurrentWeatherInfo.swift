//
//  CurrentWeatherInfo.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

struct CurrentWeatherInfo: Codable {
    var temperature: Float = 0.0
    var weatherCode: Int = -1
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
    }
}
