//
//  MainWeatherView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 08..
//

import SwiftUI
import CoreData

struct MainWeatherView: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var currentWeather: WeatherDetail?
    @EnvironmentObject private var viewModel: HomeViewModel
    var savedName: String
    var savedTemp: Double
    var savedIcon: String
    var savedDate: Date
    var savedFeelsLike: Double
    var savedType: String
    
    var temp: String {
        
        let temp = String(format: "%.1f", savedTemp)
        return ("\(temp)°")
    }
    
    var feelsLike: String {
        
        let roundedFeelsLike = String(format: "%.1f", savedFeelsLike)
        return ("\(roundedFeelsLike)°")
    }
    
    var date: String {
        let todaysDate = String("\(currentWeather?.date ?? Date(timeIntervalSince1970: .zero))")
        return todaysDate
    }
    
    var icon: String {
        var image = "WeatherIcon"
        if let weatherIcon = currentWeather?.weather.first {
            image = weatherIcon.icon
        }
        return image
    }
    
    var weatherType: String {
        return savedType
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                Image(systemName: "location.north.circle.fill")
                    .foregroundColor(.white)
                Text(savedName)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            
            
            Text(date)
                .font(.caption)
                .fontWeight(.medium)
                .opacity(0.5)
                .foregroundColor(.white)
            
            HStack {
                Image(savedIcon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                Text("\(temp)")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            
            
            Text("Feels like: \(feelsLike)")
                .fontWeight(.regular)
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Text(weatherType)
                .fontWeight(.regular)
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
    }
}

/*struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}*/
