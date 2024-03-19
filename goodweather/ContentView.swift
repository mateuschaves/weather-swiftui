//
//  ContentView.swift
//  goodweather
//
//  Created by Mateus Henrique on 18/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init(weatherVM: WeatherViewModel) {
        self.weatherVM = WeatherViewModel(weatherService: WeatherService())
    }
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }
            .font(.custom("Arial", size: 50))
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            .fixedSize()
            
            Text(self.weatherVM.temperature)
            .font(.custom("Arial", size: 100))
            .foregroundColor(Color.white)
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            .offset(y: 100)
            .offset(y: -100)
            .fixedSize()
        }
        .frame(
            minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,
            maxWidth:
                    .infinity,
            minHeight: 0,
            maxHeight:
                    .infinity
        ).background(Color.green)
        .ignoresSafeArea(.all)
    }
}

#if DEBUG
#Preview {
    ContentView(weatherVM: WeatherViewModel(weatherService: WeatherService()))
}
#endif
