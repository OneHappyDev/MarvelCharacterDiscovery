//
//  APIInformation.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//
/*
 ATTENTION!
 Marvel API keys must be placed in this file for this software to function.   It's free to sign up and can be found at developer.marvel.com
 */

import Foundation
import CryptoKit

/* YOU MUST INSERT VALID API PUBLIC AND PRIVATE KEY HERE  */
struct APIInformation {
    static let publicKey = ""  /* MUST INSERT VALID PUBLIC KEY */
    static let privateKey = ""  /* MUST INSERT VALUE PRIVATE KEY */
    
    static let characterAPI = "https://gateway.marvel.com:443/v1/public/characters"
    static let comicDetailAPI = "https://gateway.marvel.com:443/v1/public/characters/[characterID]/comics"
    
    func characterURL() -> URL? {
        var url = URL(string: APIInformation.characterAPI)
        let tsValue = "\(Date().timeIntervalSince1970.rounded())"
        let valueToHash = tsValue + APIInformation.privateKey + APIInformation.publicKey
        url?.append(queryItems: [URLQueryItem(name: "apikey", value: APIInformation.publicKey)])
        url?.append(queryItems: [URLQueryItem(name: "hash", value: valueToHash.MD5)])
        url?.append(queryItems: [URLQueryItem(name: "ts", value: tsValue)])
        return url
    }
    
    func comicDetailURL(for characterIdentifier: Int) -> URL? {
        let urlString = APIInformation.comicDetailAPI.replacingOccurrences(of: "[characterID]", with: "\(characterIdentifier)")
        var url = URL(string: urlString)
        let tsValue = "\(Date().timeIntervalSince1970.rounded())"
        let valueToHash = tsValue + APIInformation.privateKey + APIInformation.publicKey
        url?.append(queryItems: [URLQueryItem(name: "apikey", value: APIInformation.publicKey)])
        url?.append(queryItems: [URLQueryItem(name: "hash", value: valueToHash.MD5)])
        url?.append(queryItems: [URLQueryItem(name: "ts", value: tsValue)])
        return url
    }
}

extension String {
var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}
