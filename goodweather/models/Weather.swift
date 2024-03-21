//
//  Weather.swift
//  goodweather
//
//  Created by Mateus Henrique on 18/03/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
}
