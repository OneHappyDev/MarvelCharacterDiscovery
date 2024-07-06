//
//  CharacterListViewModelTests.swift
//  MarvelDiscoveryTests
//
//  Created by Joe Kosowicz on 7/5/24.
//

import XCTest
import Combine
@testable import MarvelDiscovery

final class CharacterListViewModelTests: XCTestCase {

    func testCharacterDataLoadsWithMockService() throws {
        let mockFetch = MarvelDataFetchingTestingMock()
        let viewModel = CharacterListViewModel(characterFetchingService: mockFetch, scheduler: ImmediateScheduler.shared)
        XCTAssert(viewModel.isLoading == true)
        
        mockFetch.emitCharacters(characters: [CharacterFetchCharacterData(id: 1, name: "Test", thumbnail: Thumbnail(path: "", pathType: ""))])
        XCTAssert(viewModel.isLoading == false)
        XCTAssert(viewModel.characters.first?.name == "Test")
    }
}
