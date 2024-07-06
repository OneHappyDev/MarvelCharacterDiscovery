//
//  CharacterDetailsViewModelTests.swift
//  MarvelDiscoveryTests
//
//  Created by Joe Kosowicz on 7/5/24.
//

import XCTest
import Combine
@testable import MarvelDiscovery

final class CharacterDetailsViewModelTests: XCTestCase {

    func testComicDataLoadsWithMockService() throws {
        let mockFetch = MarvelDataFetchingTestingMock()
        let viewModel = CharacterDetailViewModel(characterId: 1, characterFetchingService: mockFetch, scheduler: ImmediateScheduler.shared)
        XCTAssert(viewModel.isLoading == true)
        
        mockFetch.emitComics(comics: [Comic(id: 1, title: "Episode 1: The Episode", thumbnail: Thumbnail(path: "", pathType: "")), Comic(id: 2, title: "Episode 2: The stunning conclusion", thumbnail: Thumbnail(path: "", pathType: ""))])
        XCTAssert(viewModel.isLoading == false)
        XCTAssert(viewModel.comics.count == 2)
    }
}
