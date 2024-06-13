//
//  Service.swift
//  WeatherApp
//
//  Created by Katherine Chambers on 2024/06/11.
//

import Foundation

class Services: ObservableObject {
    
    let weatherService: WeatherService
    
    init() {
        self.weatherService = WeatherAPI()
    }
}
