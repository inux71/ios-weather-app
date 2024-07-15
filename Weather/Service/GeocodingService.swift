//
//  GeocodingService.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class GeocodingService {
    func getCities(name: String) async throws -> [City] {
        guard let url: URL = URL(string: "https://geocoding-api.open-meteo.com/v1/search?name=\(name)") else {
            throw GeocodingError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GeocodingError.invalidResponse
        }
        
        do {
            let decoder: JSONDecoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(GeocodingResponse.self, from: data)
                .results
        } catch {
            throw GeocodingError.invalidData
        }
    }
}
