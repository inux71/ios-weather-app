//
//  GeocodingError.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
