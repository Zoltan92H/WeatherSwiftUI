//
//  HourlyForecastDetailList.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 11..
//

import SwiftUI

struct HourlyForecastDetailList: View {
    @Binding var hourlyForecastList: WeatherForecast?
    
    var body: some View {
        VStack {
            Text(Localization.hourlyForecastLabel)
                .font(.system(size: 14))
                .padding(.top, 10)
            
            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(hourlyForecastList?.list ?? [], id: \.dt) { forecast in
                        HourlyForecastDetailView(forecast: forecast)
                        Spacer().frame(width: 24)
                    }
                    
                    
                }
                .padding(.horizontal, 15)
                    .padding(.bottom, 10)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .center)
        .background(Color.theme.bottomBlue.opacity(0.3))
        .cornerRadius(20)
    }
}

/*struct HourlyForecastDetailList_Previews: PreviewProvider {
 static var previews: some View {
 HourlyForecastDetailList(hourlyForecastList: HourlyForecastDetailList)
 }
 }*/
