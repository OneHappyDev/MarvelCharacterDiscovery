//
//  MarvelDataFecthingMock.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import Combine

class MarvelDataFetchingMock: MarvelDataFetching {
    func loadComics(for: Int) -> AnyPublisher<[Comic], any Error> {
        guard let url = Bundle.main.url(forResource: "comics", withExtension: "json") else {
            return Fail<[Comic], Error>(error: MarvelDataFetchError.FailureToLoad)
                .eraseToAnyPublisher()
        }
  
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error -> Error in
              return MarvelDataFetchError.FailureToLoad
            }
            .map { $0.data }
            .decode(type: ComicsFetchData.self, decoder: JSONDecoder())
            .map { results in
                results.data.results
            }
            .eraseToAnyPublisher()
    }
    
    func loadCharaters() -> AnyPublisher<[CharacterFetchCharacterData], any Error> {
        
        guard let url = Bundle.main.url(forResource: "characters", withExtension: "json") else {
            return Fail<[CharacterFetchCharacterData], Error>(error: MarvelDataFetchError.FailureToLoad)
                .eraseToAnyPublisher()
        }
  
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharacterFecthData.self, decoder: JSONDecoder())
            .map { results in
                results.data.results
            }
            .eraseToAnyPublisher()
    }
}
