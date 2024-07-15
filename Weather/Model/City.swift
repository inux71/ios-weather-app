//
//  City.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

struct City: Codable, Hashable {
    let name: String
    let latitude: Double
    let longitude: Double
    let countryCode: String
    let country: String
}
