//
//  UserDefaultsRepository.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class UserDefaultsRepository {
    func write<T: Codable>(forKey key: String, value: T) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func readString(forKey key: String, defaultValue: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? defaultValue
    }
    
    func clear() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}