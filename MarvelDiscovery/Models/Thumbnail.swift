//
//  Thumbnail.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String
    let pathType: String
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case pathType = "extension"
    }
}
