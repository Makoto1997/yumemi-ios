//
//  WeatherModel.swift
//  yumemi-ios
//
//  Created by Makoto on 2022/05/12.
//

import Foundation

struct APIRequest: Codable {
    
    let area: String
    let date: String
}

struct WeatherModel: Codable {
    
    let weather: String
    let maxTemp: Int
    let minTemp: Int
    let date: String
    
    enum CodingKeys: String, CodingKey {
        
        case weather
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case date
    }
}
