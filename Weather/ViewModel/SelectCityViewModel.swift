//
//  SelectCityViewModel.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class SelectCityViewModel: ObservableObject {
    private let geocodingService: GeocodingService = GeocodingService()
    private let userDefaultsRepository: UserDefaultsRepository = UserDefaultsRepository()
    
    @Published var text: String = ""
    @Published var cities: [City] = []
    
    func getCities() {
        Task {
            do {
                let cities: [City] = try await geocodingService.getCities(name: text)
                
                DispatchQueue.main.async {
                    self.cities = cities
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
    
    func saveToUserDefaults(city: City) {
        userDefaultsRepository.write(forKey: "name", value: city.name)
        userDefaultsRepository.write(forKey: "latitude", value: city.latitude)
        userDefaultsRepository.write(forKey: "longitude", value: city.longitude)
    }
}
