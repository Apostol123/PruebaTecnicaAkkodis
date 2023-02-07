import Foundation
@testable import PruebaTecnicaAkkodis

class CharacterDetailInteractorProtocolMock: CharacterDetailInteractorProtocol {

    //MARK: - getCharacter

    var getCharacterCharacterIdCompletionCallsCount = 0
    var getCharacterCharacterIdCompletionCalled: Bool {
        return getCharacterCharacterIdCompletionCallsCount > 0
    }
    var getCharacterCharacterIdCompletionReceivedArguments: (characterId: Int, completion: (Result<Character, APIError>) -> Void)?
    var getCharacterCharacterIdCompletionReceivedInvocations: [(characterId: Int, completion: (Result<Character, APIError>) -> Void)] = []
    var getCharacterCharacterIdCompletionClosure: ((Int, @escaping (Result<Character, APIError>) -> Void) -> Void)?

    func getCharacter(characterId: Int, completion: @escaping (Result<Character, APIError>) -> Void) {
        getCharacterCharacterIdCompletionCallsCount += 1
        getCharacterCharacterIdCompletionReceivedArguments = (characterId: characterId, completion: completion)
        getCharacterCharacterIdCompletionReceivedInvocations.append((characterId: characterId, completion: completion))
        getCharacterCharacterIdCompletionClosure?(characterId, completion)
    }

    //MARK: - getEpisode

    var getEpisodeUrlCompletionCallsCount = 0
    var getEpisodeUrlCompletionCalled: Bool {
        return getEpisodeUrlCompletionCallsCount > 0
    }
    var getEpisodeUrlCompletionReceivedArguments: (url: String, completion: (Result<CharacterEpisode, APIError>) -> Void)?
    var getEpisodeUrlCompletionReceivedInvocations: [(url: String, completion: (Result<CharacterEpisode, APIError>) -> Void)] = []
    var getEpisodeUrlCompletionClosure: ((String, @escaping (Result<CharacterEpisode, APIError>) -> Void) -> Void)?

    func getEpisode(url: String, completion: @escaping (Result<CharacterEpisode, APIError>) -> Void) {
        getEpisodeUrlCompletionCallsCount += 1
        getEpisodeUrlCompletionReceivedArguments = (url: url, completion: completion)
        getEpisodeUrlCompletionReceivedInvocations.append((url: url, completion: completion))
        getEpisodeUrlCompletionClosure?(url, completion)
    }

    //MARK: - cancelTask

    var cancelTaskForCallsCount = 0
    var cancelTaskForCalled: Bool {
        return cancelTaskForCallsCount > 0
    }
    var cancelTaskForReceivedUrl: String?
    var cancelTaskForReceivedInvocations: [String] = []
    var cancelTaskForClosure: ((String) -> Void)?

    func cancelTask(for url: String) {
        cancelTaskForCallsCount += 1
        cancelTaskForReceivedUrl = url
        cancelTaskForReceivedInvocations.append(url)
        cancelTaskForClosure?(url)
    }

}
class CharacterDetailViewProtocolMock: CharacterDetailViewProtocol {

    //MARK: - layout

    var layoutWithCallsCount = 0
    var layoutWithCalled: Bool {
        return layoutWithCallsCount > 0
    }
    var layoutWithReceivedCharacter: Character?
    var layoutWithReceivedInvocations: [Character] = []
    var layoutWithClosure: ((Character) -> Void)?

    func layout(with character: Character) {
        layoutWithCallsCount += 1
        layoutWithReceivedCharacter = character
        layoutWithReceivedInvocations.append(character)
        layoutWithClosure?(character)
    }

    //MARK: - showLoader

    var showLoaderCallsCount = 0
    var showLoaderCalled: Bool {
        return showLoaderCallsCount > 0
    }
    var showLoaderClosure: (() -> Void)?

    func showLoader() {
        showLoaderCallsCount += 1
        showLoaderClosure?()
    }

    //MARK: - hideLoader

    var hideLoaderCallsCount = 0
    var hideLoaderCalled: Bool {
        return hideLoaderCallsCount > 0
    }
    var hideLoaderClosure: (() -> Void)?

    func hideLoader() {
        hideLoaderCallsCount += 1
        hideLoaderClosure?()
    }

    //MARK: - addNoDataView

    var addNoDataViewDescriptionCallsCount = 0
    var addNoDataViewDescriptionCalled: Bool {
        return addNoDataViewDescriptionCallsCount > 0
    }
    var addNoDataViewDescriptionReceivedDescription: String?
    var addNoDataViewDescriptionReceivedInvocations: [String?] = []
    var addNoDataViewDescriptionClosure: ((String?) -> Void)?

    func addNoDataView(description: String?) {
        addNoDataViewDescriptionCallsCount += 1
        addNoDataViewDescriptionReceivedDescription = description
        addNoDataViewDescriptionReceivedInvocations.append(description)
        addNoDataViewDescriptionClosure?(description)
    }

    //MARK: - removeNoDataView

    var removeNoDataViewCallsCount = 0
    var removeNoDataViewCalled: Bool {
        return removeNoDataViewCallsCount > 0
    }
    var removeNoDataViewClosure: (() -> Void)?

    func removeNoDataView() {
        removeNoDataViewCallsCount += 1
        removeNoDataViewClosure?()
    }

}
class CharacterListInteractorProtocolMock: CharacterListInteractorProtocol {

    //MARK: - getCharacters

    var getCharactersCompletionCallsCount = 0
    var getCharactersCompletionCalled: Bool {
        return getCharactersCompletionCallsCount > 0
    }
    var getCharactersCompletionReceivedCompletion: ((Result<DtoCharacterList, APIError>) -> Void)?
    var getCharactersCompletionReceivedInvocations: [((Result<DtoCharacterList, APIError>) -> Void)] = []
    var getCharactersCompletionClosure: ((@escaping (Result<DtoCharacterList, APIError>) -> Void) -> Void)?

    func getCharacters(completion: @escaping (Result<DtoCharacterList, APIError>) -> Void) {
        getCharactersCompletionCallsCount += 1
        getCharactersCompletionReceivedCompletion = completion
        getCharactersCompletionReceivedInvocations.append(completion)
        getCharactersCompletionClosure?(completion)
    }

}
class CharacterListViewProtocolMock: CharacterListViewProtocol {

    //MARK: - layout

    var layoutWithCallsCount = 0
    var layoutWithCalled: Bool {
        return layoutWithCallsCount > 0
    }
    var layoutWithReceivedCharacter: [Character]?
    var layoutWithReceivedInvocations: [[Character]] = []
    var layoutWithClosure: (([Character]) -> Void)?

    func layout(with character: [Character]) {
        layoutWithCallsCount += 1
        layoutWithReceivedCharacter = character
        layoutWithReceivedInvocations.append(character)
        layoutWithClosure?(character)
    }

    //MARK: - showLoader

    var showLoaderCallsCount = 0
    var showLoaderCalled: Bool {
        return showLoaderCallsCount > 0
    }
    var showLoaderClosure: (() -> Void)?

    func showLoader() {
        showLoaderCallsCount += 1
        showLoaderClosure?()
    }

    //MARK: - hideLoader

    var hideLoaderCallsCount = 0
    var hideLoaderCalled: Bool {
        return hideLoaderCallsCount > 0
    }
    var hideLoaderClosure: (() -> Void)?

    func hideLoader() {
        hideLoaderCallsCount += 1
        hideLoaderClosure?()
    }

    //MARK: - addNoDataView

    var addNoDataViewDescriptionCallsCount = 0
    var addNoDataViewDescriptionCalled: Bool {
        return addNoDataViewDescriptionCallsCount > 0
    }
    var addNoDataViewDescriptionReceivedDescription: String?
    var addNoDataViewDescriptionReceivedInvocations: [String?] = []
    var addNoDataViewDescriptionClosure: ((String?) -> Void)?

    func addNoDataView(description: String?) {
        addNoDataViewDescriptionCallsCount += 1
        addNoDataViewDescriptionReceivedDescription = description
        addNoDataViewDescriptionReceivedInvocations.append(description)
        addNoDataViewDescriptionClosure?(description)
    }

    //MARK: - removeNoDataView

    var removeNoDataViewCallsCount = 0
    var removeNoDataViewCalled: Bool {
        return removeNoDataViewCallsCount > 0
    }
    var removeNoDataViewClosure: (() -> Void)?

    func removeNoDataView() {
        removeNoDataViewCallsCount += 1
        removeNoDataViewClosure?()
    }

}

extension DtoCharacterList {
    static func emptyStub() -> DtoCharacterList {
        return DtoCharacterList(info: Info(count: 0, pages: 0, next: "", prev: nil), results: [])
    }
    
    static func characterStub() -> DtoCharacterList {
        return DtoCharacterList(info: Info(count: 0, pages: 0, next: "", prev: nil), results: [Character.emptyStub()])
    }
}
                                                                                               
extension Character {
    static func emptyStub() -> Character {
        return Character(id: 0, name: "", status: "", species: Species.human, type: "", gender: Gender.male, origin: Location(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: "", created: "")
    }
}
