//
//  MapView.swift
//  WeatherApp
//
//  Created by Katherine Chambers on 2024/06/13.
//

import SwiftUI

struct MapView<ViewModel: MapViewModelType>: View {
    
    @StateObject var vm: ViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    MapView()
//}
