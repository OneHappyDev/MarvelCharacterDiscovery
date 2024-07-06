//
//  MarvelDiscoveryApp.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import SwiftUI

@main
struct MarvelDiscoveryApp: App {
    let viewModel = CharacterListViewModel(characterFetchingService: MarvelDataFetchingImplementation())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CharacterDiscoveryView(viewModel: viewModel)
            }
        }
    }
}
