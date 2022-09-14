//
//  ColorTheme.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 08..
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let topBlue = Color("topBlue")
    let bottomBlue = Color("bottomBlue")
    let secondaryText = Color("SecondaryTextColor")
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let forecastBackground = Color("forecastBackground")
}
