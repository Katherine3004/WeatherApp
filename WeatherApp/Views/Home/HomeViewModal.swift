//
//  HomeViewModal.swift
//  WeatherApp
//
//  Created by Katherine Chambers on 2024/06/11.
//

import SwiftUI

enum HomeViewState {
    case loading
    case loaded
    case error
}

protocol HomeViewModalType: ObservableObject {
    
    var weatherResponse: Weather? { get set }
    var state: HomeViewState { get set }
    
    func fetchWeather(lat: String, long: String)
}

class HomeViewModal: ObservableObject,  HomeViewModalType {
    
    @Published var weatherResponse: Weather?
    @Published var state: HomeViewState = .loading
    
    let services = Services()
    
    init() {
        fetchWeather(lat: "-29.85", long: "31.02")
    }
    
    func fetchWeather(lat: String, long: String) {
        Task {
            do {
                await updateState(state: .loading)
                let response = try await services.weatherService.fetchWeather(lat: lat, long: long)
                print(response)
                await MainActor.run {
                    self.weatherResponse = response
                    self.state = .loaded
                }
            }
            catch {
                await updateState(state: .error)
                print("DEBUG: fetchWeather(lat: String, long: String): \(error)")
            }
        }
    }
    
    @MainActor
    func updateState(state: HomeViewState) {
        self.state = state
    }
}
   
