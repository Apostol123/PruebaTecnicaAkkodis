import Foundation

class CharacterListInteractor: CharacterListInteractorProtocol {
    private var dataManager: CharacterListDataManagerProtocol

    init(dataManager: CharacterListDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
