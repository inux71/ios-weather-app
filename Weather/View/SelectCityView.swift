//
//  SelectCityView.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

struct SelectCityView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel: SelectCityViewModel = SelectCityViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.cities, id: \.self) { city in
                    CityLabel(
                        name: city.name,
                        country: city.country,
                        countryCode: city.countryCode,
                        onTap: {
                            viewModel.saveToUserDefaults(city: city)
                            
                            dismiss()
                        }
                    )
                }
            }
        }
        .navigationTitle("Search City")
        .searchable(
            text: $viewModel.text,
            prompt: "Search city"
        )
        .onChange(of: viewModel.text) { _, _ in
            viewModel.getCities()
        }
    }
}

#Preview {
    SelectCityView()
}
