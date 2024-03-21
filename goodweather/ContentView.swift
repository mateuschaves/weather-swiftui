//
//  ContentView.swift
//  goodweather
//
//  Created by Mateus Henrique on 18/03/24.
//

import SwiftUI

struct ContentView: View {
        
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    @State private var weather: Weather?
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    
    private func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinateByCity(city) else { return }
            
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            
        }
    }
    
    var body: some View {
        VStack {
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }.task(id: isFetchingWeather) {
                    if isFetchingWeather {
                        await fetchWeather()
                        isFetchingWeather = false
                        city = ""
                    }
                }
            
            Spacer()
            
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp ?? 0))
                    .font(.system(size: 100))
            }
            
            Spacer()
           
        }.padding()
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
