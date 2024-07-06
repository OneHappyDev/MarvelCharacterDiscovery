//
//  MarvelDataFetchingTestingMock.swift
//  MarvelDiscoveryTests
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import Combine
@testable import MarvelDiscovery

// Mock Service so Unit Tests can emit values as desired to validate view model loading appropriately
class MarvelDataFetchingTestingMock: MarvelDataFetching {

    private var characterSubject = PassthroughSubject<[Character], any Error>()
    private var comicsSubject = PassthroughSubject<[Comic], any Error>()
    
    func emitCharacters(characters: [Character]) {
        characterSubject.send(characters)
    }
    
    func emitComics(comics: [Comic]) {
        comicsSubject.send(comics)
    }
    
    func loadCharaters() -> AnyPublisher<[Character], any Error> {
        return characterSubject
            .eraseToAnyPublisher()
    }
    
    func loadComics(for: Int) -> AnyPublisher<[Comic], any Error> {
        return comicsSubject
            .eraseToAnyPublisher()
    }
}
