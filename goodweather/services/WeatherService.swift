//
//  WeatherService.swift
//  goodweather
//
//  Created by Mateus Henrique on 18/03/24.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(
            string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=74e5e437ba09cbf2d96c21a8dcd21f0b"
        ) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
