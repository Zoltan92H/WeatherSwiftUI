//
//  WeatherDetailsView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 11..
//

import SwiftUI

struct WeatherDetailsView: View {
    
    @Binding var currentWeatherData: WeatherDetail?
    
    var pressure: String {
        return ("\(currentWeatherData?.main.pressure ?? 0) hPa")
    }
    
    var feelsLike: String {
        
        let roundedFeelsLike = String(format: "%.1f", currentWeatherData?.main.feelsLike ?? 0)
        return ("\(roundedFeelsLike)°")
    }
    
    var minTemp: String {
        
        let roundedFeelsLike = String(format: "%.1f", currentWeatherData?.main.tempMin ?? 0)
        return ("\(roundedFeelsLike)°")
    }
    
    var maxTemp: String {
        
        let roundedFeelsLike = String(format: "%.1f", currentWeatherData?.main.tempMax ?? 0)
        return ("\(roundedFeelsLike)°")
    }
    
    var visibility: String {
        return ("\(currentWeatherData?.visibility ?? 0) km")
    }
    
    var humidity: String {
        return ("\(currentWeatherData?.main.humidity ?? 0)%")
    }
    
    var body: some View {
        
        VStack {
            HStack {
                WeatherDetailCell(title: Localization.minLabel, value: minTemp)
                
                WeatherDetailCell(title: Localization.maxLabel, value: maxTemp)
            }
            .frame(width: UIScreen.main.bounds.width)
            
            HStack {
                WeatherDetailCell(title: Localization.pressureLabel, value: pressure)
                
                WeatherDetailCell(title: Localization.feelsLikeLabel, value: feelsLike)
            }
            .frame(width: UIScreen.main.bounds.width)
            
            HStack {
                WeatherDetailCell(title: Localization.humidityLabel, value: humidity)
                
                WeatherDetailCell(title: Localization.visibilityLabel, value: visibility)
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .padding(.vertical, 10)
        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .center)
        .background(Color.theme.bottomBlue.opacity(0.3))
        .cornerRadius(20)
        .padding()
        
        
    }
}

/*struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(currentWeatherData: <#Binding<WeatherDetail?>#>)
    }
}*/
