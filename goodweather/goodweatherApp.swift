//
//  goodweatherApp.swift
//  goodweather
//
//  Created by Mateus Henrique on 18/03/24.
//

import SwiftUI

@main
struct goodweatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                weatherVM: WeatherViewModel(weatherService: WeatherService())
            )
        }
    }
}
