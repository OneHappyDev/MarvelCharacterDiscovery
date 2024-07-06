//
//  DiscoveryViewModel.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import SwiftUI
import Combine

class CharacterListViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var hasData = false
    @Published var characters: [Character] = []
    
    let characterFetchingService: MarvelDataFetching
    
    init<SchedulerType: Scheduler>(isLoading: Bool = true, characters: [Character] = [], characterFetchingService: MarvelDataFetching, scheduler: SchedulerType = DispatchQueue.main) {
        self.isLoading = isLoading
        self.characters = characters
        self.characterFetchingService = characterFetchingService
        
        let loadCharacters = self.characterFetchingService
            .loadCharaters()
            .eraseToAnyPublisher()
        
        loadCharacters
            .replaceError(with: [])
            .assign(to: &$characters)
        
        loadCharacters
            .replaceError(with: [])
            .map { _ in false }
            .assign(to: &$isLoading)
        
        $characters
            .map { !$0.isEmpty }
            .assign(to: &$hasData)
    }
}
