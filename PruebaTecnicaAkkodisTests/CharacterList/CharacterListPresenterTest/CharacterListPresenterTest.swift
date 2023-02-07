//
//  PruebaTecnicaAkkodisTests.swift
//  PruebaTecnicaAkkodisTests
//
//  Created by Apostol, Alexandru on 7/2/23.
//

import XCTest
@testable import PruebaTecnicaAkkodis

final class CharacterListPresenterTest: XCTestCase {
    var sut: CharacterListPresenter!
    var mockView: CharacterListViewProtocolMock!
    var mockInteractor: CharacterListInteractorProtocolMock!
    

    override func setUpWithError() throws {
        mockView = CharacterListViewProtocolMock()
        mockInteractor = CharacterListInteractorProtocolMock()
        sut = CharacterListPresenter(interactor: mockInteractor, coordinnatorOutput: {_ in})
        sut.view = mockView
    }

    override func tearDownWithError() throws {
        mockView = nil
        mockInteractor = nil
        sut = nil
    }
    
    func test_viewDidLoad_WhenMethodIsCalled_ViewShowLoaderIsCalled() {
        sut.viewDidLoad()
        XCTAssertTrue(mockView.showLoaderCalled)
    }
    
    func test_viewDidLoad_WhenMethodIsCalled_then_ViewShowLoaderIsCalled() {
        sut.viewDidLoad()
        XCTAssertTrue(mockView.showLoaderCalled)
    }
    
    func test_viewDidLoad_whenMethodsIsCalled_then_interactor_getCharactersIsCalled() {
        sut.viewDidLoad()
        XCTAssertTrue(mockInteractor.getCharactersCompletionCalled)
    }
    
    func test_viewDidLoad_give_interactorGetCharactersIsCallen_whenInteractorSuccessResponseIsRecived_then_viewHideLoaderIsHidden() {
        sut.viewDidLoad()
        let completion = mockInteractor.getCharactersCompletionReceivedInvocations.first
        completion?(.success(DtoCharacterList.emptyStub()))
        XCTAssertTrue(mockView.hideLoaderCalled)
    }
    
    func test_viewDidLoad_given_interactorGetCharactersIsCallen_whenInteractorFailureResponseIsRecived_then_viewHideLoaderIsHidden() {
        sut.viewDidLoad()
        let completion = mockInteractor.getCharactersCompletionReceivedInvocations.first
        completion?(.failure(APIError.undefined("")))
        XCTAssertTrue(mockView.hideLoaderCalled)
    }
    
    func test_viewDidLoad_given_interactorGetCharactersIsCallen_whenInteractorSucessResponseIsRecived_givenDataIsNotEmpty_then_viewLayoutWithCalled() {
        sut.viewDidLoad()
        let completion = mockInteractor.getCharactersCompletionReceivedInvocations.first
        completion?(.success(DtoCharacterList.characterStub()))
        XCTAssertTrue(mockView.layoutWithCalled)
    }
    
    func test_viewDidLoad_given_interactorGetCharactersIsCallen_whenInteractorSucessResponseIsRecived_givenDataIsEmpty_then_viewAddNoDataViewCalled() {
        sut.viewDidLoad()
        let completion = mockInteractor.getCharactersCompletionReceivedInvocations.first
        completion?(.success(DtoCharacterList.emptyStub()))
        XCTAssertTrue(mockView.addNoDataViewDescriptionCalled)
    }
    
}
