//
//  WeatherForecastService.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class WeatherForecastService {
    func getWeatherInfo(latitude: Double, longitude: Double) async throws -> WeatherInfo {
        guard let url: URL = URL(string: "https://api.open-meteo.com/v1/forecast?current=temperature_2m,weather_code&latitude=\(latitude)&longitude=\(longitude)") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder: JSONDecoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            
            return try decoder.decode(WeatherInfo.self, from: data)
        } catch {
            throw APIError.invalidData
        }
    }
}
