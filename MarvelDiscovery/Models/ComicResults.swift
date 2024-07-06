//
//  ComicResults.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation

struct ComicsFetchData: Decodable {
    let code: Int
    let data: ComicsResults
}

struct ComicsResults: Decodable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Comic]
}

struct Comic: Decodable, Identifiable {
    let id: Int
    let title: String
    let thumbnail: Thumbnail
    var imageURL: String {
        return thumbnail.path + "." + thumbnail.pathType
    }
}
