//
//  ForecastDetailView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 09..
//

import Foundation
import SwiftUI

struct DailyForecastDetailView: View {
    
    var dailyForecast: WeatherForecastDetail
    
    var day: String {
        return dailyForecast.dt.dateFromMilliseconds().dayOfTheWeek
    }
    
    var temperatureMin: String {
        let roundedTemp = String(format: "%.1f", dailyForecast.main.temp_min)
        return ("\(roundedTemp)°")
    }
    
    var temperatureMax: String {
        let roundedTemp = String(format: "%.1f", dailyForecast.main.temp_max)
        return ("\(roundedTemp)°")
    }
    
    var icon: String {
        var image = "WeatherIcon"
        if let weatherIcon = dailyForecast.weather.first {
            image = weatherIcon.icon
        }
        return image
    }
    
    var body: some View {
        HStack {
            
            Text(dailyForecast.dt.dateFromMilliseconds().dayOfTheWeek)
                .frame(width: 120, alignment: .leading)
            
            Image(icon)
                .resizable()
                .aspectRatio(UIImage(named: icon)!.size, contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Spacer()
            Text(temperatureMin)
                .frame(alignment: .leading)
                
            Spacer()
            Text(temperatureMax)
        }.padding(.horizontal, 25)
    }
    
}
