@testable import PruebaTecnicaAkkodis

import XCTest

final class CharacterDetailPresenterTest: XCTestCase {
    var sut: CharacterDetailPresenter!
    var mockView: CharacterDetailViewProtocolMock!
    var mockInteractor: CharacterDetailInteractorProtocolMock!
    var mockId: Int!

    override func setUpWithError() throws {
        mockId = 1
        mockView = CharacterDetailViewProtocolMock()
        mockInteractor = CharacterDetailInteractorProtocolMock()
        sut = CharacterDetailPresenter(characterId: mockId, interactor: mockInteractor, coordinnatorOutput: { _ in})
        sut.view = mockView
    }

    override func tearDownWithError() throws {
        mockId = nil
        mockView = nil
        mockInteractor = nil
        sut = nil
        
    }
    
    func test_viewDidLoad_WhenMethodIsCalled_then_ViewShowLoaderIsCalled() {
        sut.viewDidLoad()
        XCTAssertTrue(mockView.showLoaderCalled)
    }
    
    func testViewDidLoad_whenMethodIsCalled_then_InteractorGetCharacterIsCalled() {
        sut.viewDidLoad()
        XCTAssertTrue(mockInteractor.getCharacterCharacterIdCompletionCalled)
    }
    
    func testViewDidLoad_give_interactorFailureRespone_then_viewNoDataViewIsCalled() {
        sut.viewDidLoad()
        let completion = mockInteractor.getCharacterCharacterIdCompletionReceivedInvocations.first
        completion?.1(.failure(APIError.undefined("")))
        XCTAssertTrue(mockView.addNoDataViewDescriptionCalled)
    }
    
    func testViewDidLoad_given_interactorSucessResponse_then_viewLayoutWithCalled() {
        sut.viewDidLoad()
        let completion = mockInteractor.getCharacterCharacterIdCompletionReceivedInvocations.first
        completion?.1(.success(Character.emptyStub()))
        XCTAssertTrue(mockView.layoutWithCalled)
    }

}
