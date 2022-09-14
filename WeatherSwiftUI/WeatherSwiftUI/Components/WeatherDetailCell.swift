//
//  WeatherDetailCell.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 12..
//

import SwiftUI

struct WeatherDetailCell: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 14))
                .padding(.top, 10)
                .padding(.horizontal, 10)
            
            Divider()
            
            Text(value)
                .padding(.horizontal, 10)
                .padding(.top, 10)
                .font(.title)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.4, height: 100, alignment: .leading)
        .background(Color.theme.bottomBlue.opacity(0.3))
        .cornerRadius(10)
        .padding(.trailing, 0)
    }
}
