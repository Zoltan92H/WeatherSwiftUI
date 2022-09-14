//
//  HomeView.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 07..
//

import SwiftUI

struct HomeView: View {
    // MARK: Private properties
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject private var viewModel: HomeViewModel
    @FetchRequest(sortDescriptors: []) var savedWeather: FetchedResults<SavedWeather>
    
    var weatherData: WeatherData? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.theme.topBlue, Color.theme.bottomBlue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    SearchBarView(searchText: $viewModel.searchText)
                    
                    MainWeatherView(currentWeather: $viewModel.currentWeatherData,
                                    savedName: savedWeather.first?.name ?? viewModel.currentWeatherData?.name ?? "",
                                    savedTemp: savedWeather.first?.temperature ?? viewModel.currentWeatherData?.main.temp ?? 0,
                                    savedIcon: savedWeather.first?.icon ?? viewModel.currentWeatherData?.weather.first?.icon ?? "",
                                    savedDate: savedWeather.first?.date ?? Date(timeIntervalSince1970: .zero),
                                    savedFeelsLike: savedWeather.first?.feelsLike ?? viewModel.currentWeatherData?.main.feelsLike ?? 0,
                                    savedType: savedWeather.first?.type ?? viewModel.currentWeatherData?.weather.first?.main ?? "")
                    
                    HourlyForecastDetailList(hourlyForecastList: $viewModel.dailyWeatherForecast)
                    
                    DailyWeatherForecastDetailList(weatherForecast: $viewModel.hourlyWeatherForecast)
                    
                    WeatherDetailsView(currentWeatherData: $viewModel.currentWeatherData)
                    
                    URLView()
                    
                    Button("Save")
                    {
                        saveWeather()
                    }
                    
                }
            }
        }
    }
    
    func saveWeather() {
        
        if savedWeather.first != nil {
            let deleteWeather = savedWeather.first
            moc.delete(deleteWeather!)
        }
            
        let newWeather = SavedWeather(context: moc)
        newWeather.icon = viewModel.currentWeatherData?.weather.first?.icon
        newWeather.feelsLike = viewModel.currentWeatherData?.main.feelsLike ?? 0
        newWeather.name = viewModel.currentWeatherData?.name
        newWeather.temperature = viewModel.currentWeatherData?.main.temp ?? 0
        newWeather.date = viewModel.currentWeatherData?.date
        newWeather.type = viewModel.currentWeatherData?.weather.first?.main
        try? moc.save()
    }
    
}
