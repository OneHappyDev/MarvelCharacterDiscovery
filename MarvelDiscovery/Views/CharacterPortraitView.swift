//
//  CharacterView.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import SwiftUI

struct CharacterPortraitView: View {
    let character: CharacterFetchCharacterData
    
    var body: some View {
        VStack {
            NavigationLink {
                CharacterDetailView(character: character, viewModel: CharacterDetailViewModel(characterId: character.id, characterFetchingService: MarvelDataFetchingImplementation()))
            } label: {
                VStack(alignment: .center, spacing: 8) {
                    AsyncImage(url: URL(string: character.imageURL)) { image in
                        image.resizable()
                            .frame(width: 140, height: 140)
                    } placeholder: {
                        Color.gray
                    }
                    .clipShape(.circle)
                    Text(character.name)
                        .font(.caption)
                        .lineLimit(4)
                }
            }
            .frame(width: 240, height: 240)
        }
    }
}

#Preview {
    CharacterPortraitView(character: CharacterFetchCharacterData(id: 1, name: "Test", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", pathType: "jpg")))
}
