//
//  SelectCityView.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

struct SelectCityView: View {
    @State private var text: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1...3, id: \.self) { _ in
                    CityLabel(
                        name: "Gliwice",
                        country: "Poland",
                        countryCode: "PL"
                    )
                }
            }
        }
        .navigationTitle("Search City")
        .searchable(
            text: $text,
            prompt: "Search city"
        )
    }
}

#Preview {
    SelectCityView()
}
