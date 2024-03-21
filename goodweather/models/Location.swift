//
//  Location.swift
//  goodweather
//
//  Created by Mateus Henrique on 21/03/24.
//

import Foundation


struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}
