//
//  FetchCharacterList.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import Combine

enum MarvelDataFetchError: Error {
    case FailureToLoad
}

protocol MarvelDataFetching {
    func loadCharaters() -> AnyPublisher<[CharacterFetchCharacterData], Error>
    func loadComics(for: Int) -> AnyPublisher<[Comic], Error>
}

class MarvelDataFetchingImplementation: MarvelDataFetching {
    func loadComics(for character: Int) -> AnyPublisher<[Comic], any Error> {
        guard let url = APIInformation().comicDetailURL(for: character) else {
            return Fail<[Comic], Error>(error: MarvelDataFetchError.FailureToLoad)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ComicsFetchData.self, decoder: JSONDecoder())
            .map { results in
                results.data.results
            }
            .eraseToAnyPublisher()
    }
    
    func loadCharaters() -> AnyPublisher<[CharacterFetchCharacterData], any Error> {
        guard let url = APIInformation().characterURL() else {
            return Fail<[CharacterFetchCharacterData], Error>(error: MarvelDataFetchError.FailureToLoad)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .mapError { error -> Error in
              return MarvelDataFetchError.FailureToLoad
            }
            .map { $0.data }
            .decode(type: CharacterFecthData.self, decoder: JSONDecoder())
            .map { results in
                results.data.results
            }
            .eraseToAnyPublisher()
    }
}
