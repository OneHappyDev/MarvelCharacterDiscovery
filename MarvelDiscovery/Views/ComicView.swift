//
//  ComicView.swift
//  MarvelDiscovery
//
//  Created by Joe Kosowicz on 7/5/24.
//

import Foundation
import SwiftUI

struct ComicView: View {
    let comic: Comic
    
    var body: some View {
        NavigationLink {
            ComicDetailView()
        } label: {
            VStack(alignment: .center, spacing: 8) {
                AsyncImage(url: URL(string: comic.imageURL)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                Text(comic.title)
                    .font(.caption)
                    .lineLimit(8)
                    .frame(maxWidth: 200)
            }
        }
    }
}

#Preview {
    ComicView(comic: Comic(id: 1, title: "An Excellent Read", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806", pathType: "jpg")))
}
