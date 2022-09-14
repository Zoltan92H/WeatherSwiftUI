//
//  URLView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 13..
//

import SwiftUI

struct URLView: View {
    var body: some View {
        Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
            .font(.title3)
            .foregroundColor(.white)
    }
}

struct URLView_Previews: PreviewProvider {
    static var previews: some View {
        URLView()
    }
}
