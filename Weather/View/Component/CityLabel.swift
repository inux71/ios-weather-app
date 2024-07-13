//
//  CityLabel.swift
//  Weather
//
//  Created by Kacper Grabiec on 13/07/2024.
//

import SwiftUI

struct CityLabel: View {
    @Environment(\.dismiss) private var dismiss
    
    let name: String
    let country: String
    let countryCode: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                AsyncImage(url: URL(string: "https://hatscripts.github.io/circle-flags/flags/\(countryCode.lowercased()).svg"))
                    .frame(
                        width: 32,
                        height: 32
                    )
                    .clipShape(Circle())
                
                Text(name)
                    .frame(width: geometry.size.width * 0.3)
                
                Text(country)
                    .frame(width: geometry.size.width * 0.6)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 32)
        .contentShape(Rectangle())
        .onTapGesture {
            dismiss()
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    CityLabel(
        name: "Gliwice",
        country: "Poland",
        countryCode: "PL"
    )
}
