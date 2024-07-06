//
//  CharacterDiscoveryView.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import SwiftUI

struct CharacterDiscoveryView: View {
    
    @ObservedObject var viewModel: CharacterListViewModel
    
    var body: some View {
        if viewModel.isLoading {
            loadingView
        } else if !viewModel.hasData {
            errorView
        } else {
            VStack(alignment: .leading) {
                Text("Characters")
                    .font(.headline)
                    .padding()
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(viewModel.characters) { character in
                            CharacterPortraitView(character: character)
                                .padding()
                        }
                    }
                }
            }
        }
    }
    
    var loadingView: some View {
        return ProgressView()
    }
    
    var errorView: some View {
        VStack {
            Text("Error Loading: Please valdiate your Public and Private Key is populated in APIInformation.swift")
        }
    }
}

#Preview {
    CharacterDiscoveryView(viewModel: CharacterListViewModel( characterFetchingService: MarvelDataFetchingMock()))
}
