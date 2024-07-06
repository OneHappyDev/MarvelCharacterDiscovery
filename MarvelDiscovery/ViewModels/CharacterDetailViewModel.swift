//
//  DetailViewModel.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import SwiftUI
import Combine

class CharacterDetailViewModel: ObservableObject {
    let characterId: Int
    @Published var isLoading = true
    @Published var comics: [Comic] = []
    
    let characterFetchingService: MarvelDataFetching
    
    init<SchedulerType: Scheduler>(characterId: Int, isLoading: Bool = true, comics: [Comic] = [], characterFetchingService: MarvelDataFetching, scheduler: SchedulerType = DispatchQueue.main) {
        self.characterId = characterId
        self.isLoading = isLoading
        self.comics = comics
        self.characterFetchingService = characterFetchingService
        
        let loadComics = self.characterFetchingService
            .loadComics(for: characterId)
            .eraseToAnyPublisher()
        
        loadComics
            .replaceError(with: [])
            .assign(to: &$comics)
        
        loadComics
            .replaceError(with: [])
            .map { _ in false }
            .assign(to: &$isLoading)
    }
}
