//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let weatherForecastService: WeatherForecastService = WeatherForecastService()
    private let userDefaultsRepository: UserDefaultsRepository = UserDefaultsRepository()
    
    @Published var cityName: String = ""
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    @Published var weatherInfo: WeatherInfo = WeatherInfo()
    
    func initDataFromUserDefaults() {
        cityName = userDefaultsRepository.readString(forKey: "name", defaultValue: "")
        latitude = userDefaultsRepository.readDouble(forKey: "latitude")
        longitude = userDefaultsRepository.readDouble(forKey: "longitude")
        
        Task {
            do {
                let weatherInfo: WeatherInfo = try await weatherForecastService.getWeatherInfo(latitude: latitude, longitude: longitude)
                
                DispatchQueue.main.async {
                    self.weatherInfo = weatherInfo
                }
            } catch APIError.invalidURL {
                print("Invalid URL")
            } catch APIError.invalidData {
                print("Invalid Data")
            } catch APIError.invalidResponse {
                print("Invalid Response")
            } catch {
                print("Unknown Error")
            }
        }
    }
    
    func getWeatherDescription() -> String {
        switch weatherInfo.current.weatherCode {	
        case 0:
            return "Clear sky"
        case 1:
            return "Mainly clear"
        case 2:
            return "Partly cloudy"
        case 3:
            return "Overcast"
        case 45:
            return "Fog"
        case 48:
            return "Depositing rime fog"
        case 51:
            return "Drizzle: Light"
        case 53:
            return "Drizzle: Moderate"
        case 55:
            return "Drizzle: Dense"
        case 56:
            return "Freezing Drizzle: Light"
        case 57:
            return "Freezing Drizzle: Dense"
        case 61:
            return "Rain: Slight"
        case 63:
            return "Rain: Moderate"
        case 65:
            return "Rain: Heavy"
        case 66:
            return "Freezing Rain: Light"
        case 67:
            return "Freezing Rain: Heavy"
        case 71:
            return "Snow fall: Slight"
        case 73:
            return "Snow fall: Moderate"
        case 75:
            return "Snow fall: Heavy"
        case 77:
            return "Snow grains"
        case 80:
            return "Rain showers: Slight"
        case 81:
            return "Rain showers: Moderate"
        case 82:
            return "Rain showers: Violent"
        case 85:
            return "Snow showers: Slight"
        case 86:
            return "Snow showers: Heavy"
        case 95:
            return "Thunderstorm: Slight or moderate"
        case 96:
            return "Thunderstorm with slight hail"
        case 99:
            return "Thunderstorm with heavy hail"
        default:
            return ""
        }
    }
    
    func getWeatherImage() -> String {
        switch weatherInfo.current.weatherCode {
        case 0, 1:
            return "sun.max"
        case 2:
            return "cloud.sun"
        case 3:
            return "cloud"
        case 45, 48:
            return "cloud.fog"
        case 51, 53, 55, 56, 57:
            return "cloud.drizzle"
        case 61, 66:
            return "sun.rain"
        case 63:
            return "cloud.rain"
        case 65, 67, 80, 81, 82:
            return "cloud.heavyrain"
        case 71:
            return "sun.snow"
        case 73, 75, 85, 86:
            return "cloud.snow"
        case 77:
            return "cloud.hail"
        case 95, 96, 99:
            return "cloud.bolt.rain"
        default:
            return ""
        }
    }
}
