//
//  DetailView.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import SwiftUI

struct CharacterDetailView: View {
    
    let character: CharacterFetchCharacterData
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        ZStack {
            HStack {
                AsyncImage(url: URL(string: character.imageURL)) { image in
                    image.resizable()
                        .mask(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .top, endPoint: .bottom))
                        .mask(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .leading, endPoint: .trailing))
                        .edgesIgnoringSafeArea(.all)
                } placeholder: {
                    Color.gray
                        .edgesIgnoringSafeArea(.all)
                }
                Spacer()
            }
            
            HStack {
                Text(character.name)
                    .font(.title)
                Spacer()
            }
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack(alignment: .leading) {
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack(alignment: .bottom) {
                            ForEach(viewModel.comics) { comic in
                                ComicView(comic: comic)
                                    .padding()
                            }
                        }
                        .frame(maxHeight: 400)
                    }
                }
            }
        }
    }
}

#Preview {
    CharacterDetailView(character: CharacterFetchCharacterData(id: 1, name: "3-D Man", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", pathType: "jpg")), viewModel: CharacterDetailViewModel(characterId: 1, characterFetchingService: MarvelDataFetchingMock()))
}
