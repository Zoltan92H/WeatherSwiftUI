//
//  WeatherIconView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 08..
//

import SwiftUI

struct WeatherIconView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            //.font(.largeTitle)
            .font(.system(size: 40))
            //.foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherIconView(iconName: "cloud.fill")
                .previewLayout(.sizeThatFits)
            
            WeatherIconView(iconName: "cloud.empty")
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
        }
    }
}
