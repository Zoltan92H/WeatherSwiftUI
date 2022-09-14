//
//  SearchBarView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 08..
//

import SwiftUI

struct SearchBarView: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var searchText: String {
        didSet {
            
        }
    }
    @EnvironmentObject private var vm: HomeViewModel
    private let citiesList: [String] = ["Budapest", "London", "Paris"]
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by city name...", text: $searchText, onCommit: searchWeather)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.bottomBlue)
                .opacity(0.5)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
    
    private func searchWeather() {
        guard !searchText.isEmpty, citiesList.contains(searchText) else { return }
        
        WeatherDataService.shared.searchedCity = searchText
        DailyWeatherForecastService.shared.searchedCity = searchText
        
    }
    
    
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
