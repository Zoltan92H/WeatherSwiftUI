//
//  WeatherForecastDetailList.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 09..
//

import Foundation
import SwiftUI

struct DailyWeatherForecastDetailList: View {
    
    @Binding var weatherForecast: [WeatherForecastDetail]?
    
    var body: some View {
            VStack(spacing: 4) {
                Text(Localization.dailyForecastLabel)
                    .font(.system(size: 14))
                
                Divider()
                
                ForEach(weatherForecast ?? [], id: \.dt) { forecast in
                    DailyForecastDetailView(dailyForecast: forecast)
                }
            }
            .padding(.vertical, 10)
            .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            .background(Color.theme.bottomBlue.opacity(0.3))
            .cornerRadius(20)
            .padding()
        
        
        
    }
}
