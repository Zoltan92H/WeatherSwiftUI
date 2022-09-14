//
//  HourlyForecastDetailView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 11..
//

import SwiftUI

struct HourlyForecastDetailView: View {
    
    var forecast: WeatherForecastDetail
    
    var hour: String {
        return forecast.dt.dateFromMilliseconds().hourOfTheDay
    }
    
    var icon: String {
        var image = "WeatherIcon"
        if let weatherIcon = forecast.weather.first {
            image = weatherIcon.icon
        }
        return image
    }
    
    var temp: String {
        let roundedTemp = String(format: "%.0f", forecast.main.temp)
        return ("\(roundedTemp)°")
    }
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text(hour)
            Text("\(forecast.main.humidity)%")
                .font(.system(size: 12))
                .foregroundColor(
                    .init(red: 127/255,
                          green: 1,
                          blue: 212/255)
                )
            Image(icon)
                .resizable()
                .aspectRatio(UIImage(named: icon)!.size, contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(temp)
        }.padding(.all, 0)
    }
}

/*struct HourlyForecastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastDetailView(forecast: WeatherForecastDetail.emptyInit())
    }
}*/
