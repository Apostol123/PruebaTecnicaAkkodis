import Foundation

class CharacterListInteractor: CharacterListInteractorProtocol {
    private var dataManager: CharacterListDataManagerProtocol

    init(dataManager: CharacterListDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharacters(completion: @escaping (Result<DtoCharacterList, APIError>) -> Void) {
        dataManager.getCharacters { result in
            switch result {
            case .success(let destinations):
                completion(.success(destinations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
