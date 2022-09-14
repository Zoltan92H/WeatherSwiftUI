//
//  WeatherSwiftUIApp.swift
//  WeatherSwiftUI
//
//  Created by Zoltán Hidegkuti on 2022. 09. 06..
//

/*import SwiftUI

@main
struct WeatherSwiftUIApp: App {
    private let apiConfiguration = API.Configuration(
        baseURL: "https://api.openweathermap.org/data/2.5",
        apiKey: "cf0f31ab062ee5159fbd1c1c41a7057a"
    )
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView(
                        viewModel: HomeViewModel(
                            weatherDataService: WeatherDataService(
                                configuration: apiConfiguration
                            ),
                            dailyForecastService: DailyWeatherForecastService(
                                configuration: apiConfiguration
                            )
                        )
                    )
                    .navigationBarHidden(true)
                }
            }
        }
    }
}*/

import SwiftUI

@main
struct WeatherSwiftUIApp: App {
    //let persistenceController = PersistenceController.shared
    @StateObject private var dataController = DataController()
    
    @StateObject private var vm = DependencyManager.shared.resolve(HomeViewModel.self)
    
    init() {
        DependencyManager.setup()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    HomeView()
                        .environment(\.managedObjectContext, dataController.container.viewContext)
                        .navigationBarHidden(true)
                }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(vm)
            }
        }
    }
}
