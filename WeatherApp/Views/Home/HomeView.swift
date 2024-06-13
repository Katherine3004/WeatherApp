//
//  HomeView.swift
//  WeatherApp
//
//  Created by Katherine Chambers on 2024/06/11.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm = HomeViewModal()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("We should see something")
            switch vm.state {
            case .loading:
                Text("loading....")
            case .loaded:
                VStack(alignment: .leading) {
                    if let weatherResponse = vm.weatherResponse?.weather {
                        ForEach(weatherResponse, id: \.id) { item in
                            HStack(alignment: .center, spacing: 0) {
                                Text(item.description)
                                    .foregroundColor(.black)
                                Image(item.icon)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    else {
                        Text("empty reponse")
                    }
                }
            case .error:
                Text("Oh no")
            }
           
            
        }
    }
}

//#Preview {
//    HomeView()
//}
