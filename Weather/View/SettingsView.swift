//
//  SettingsView.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel: SettingsViewModel = SettingsViewModel()
    
    var body: some View {
        List {
            Toggle("Theme", isOn: $viewModel.darkMode)
                .onChange(of: viewModel.darkMode) {
                    viewModel.changeTheme()
                }
            
            Button("Clear cache", role: .destructive) {
                viewModel.clearCache()
                
                viewModel.isPresented = true
            }
            .alert("Cache cleared", isPresented: $viewModel.isPresented) {
                Button("OK", role: .cancel) {}
            }
        }
        .navigationTitle("Settings")
        .onAppear {
            viewModel.readThemeFromUserDefaults()
        }
    }
}

#Preview {
    SettingsView()
}
