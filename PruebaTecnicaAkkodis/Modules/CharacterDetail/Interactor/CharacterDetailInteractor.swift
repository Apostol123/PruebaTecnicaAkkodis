import Foundation

class CharacterDetailInteractor: CharacterDetailInteractorProtocol {
    private var dataManager: CharacterDetailDataManagerProtocol

    init(dataManager: CharacterDetailDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharacters(characterId: Int, completion: @escaping (Result<Character, APIError>) -> Void) {
        
        dataManager.getCharacters(characterId: String(characterId)) { result in
            switch result {
            case .success(let destinations):
                completion(.success(destinations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
