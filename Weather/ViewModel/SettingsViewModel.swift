//
//  SettingsViewModel.swift
//  Weather
//
//  Created by Kacper Grabiec on 15/07/2024.
//

import Foundation

class SettingsViewModel: ObservableObject {
    private let userDefaultsRepository: UserDefaultsRepository = UserDefaultsRepository()
    
    @Published var darkMode: Bool = false
    @Published var isPresented: Bool = false
    
    func changeTheme() {
        userDefaultsRepository.write(forKey: "darkTheme", value: darkMode)
    }
    
    func readThemeFromUserDefaults() {
        darkMode = userDefaultsRepository.readBool(forKey: "darkTheme")
    }
    
    func clearCache() {
        userDefaultsRepository.clear()
    }
}
