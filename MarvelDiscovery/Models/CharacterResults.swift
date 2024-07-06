//
//  CharacterResults.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation

struct CharacterFecthData: Decodable {
    let code: Int
    let data: CharacterResults
}

struct CharacterResults: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [CharacterFetchCharacterData]
}

struct CharacterFetchCharacterData: Decodable, Identifiable {
    let id: Int
    let name: String
    let thumbnail: Thumbnail
    var imageURL: String {
        return thumbnail.path + "." + thumbnail.pathType
    }
}
