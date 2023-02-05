import Foundation

class CharacterDetailInteractor: CharacterDetailInteractorProtocol {
    private var dataManager: CharacterDetailDataManagerProtocol

    init(dataManager: CharacterDetailDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
