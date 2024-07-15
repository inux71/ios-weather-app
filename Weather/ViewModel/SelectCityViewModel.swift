//
//  SelectCityViewModel.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class SelectCityViewModel: ObservableObject {
    private let geocodingService: GeocodingService = GeocodingService()
    
    @Published var text: String = ""
    @Published var cities: [City] = []
    
    func getCities() {
        Task {
            do {
                let cities: [City] = try await geocodingService.getCities(name: text)
                
                DispatchQueue.main.async {
                    self.cities = cities
                }
            } catch GeocodingError.invalidURL {
                print("Invalid URL")
            } catch GeocodingError.invalidData {
                print("Invalid Data")
            } catch GeocodingError.invalidResponse {
                print("Invalid Response")
            } catch {
                print("Unknown Error")
            }
        }
    }
}
