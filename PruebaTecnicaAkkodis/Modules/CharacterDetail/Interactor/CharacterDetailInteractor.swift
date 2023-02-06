import Foundation

class CharacterDetailInteractor: CharacterDetailInteractorProtocol {
    private var dataManager: CharacterDetailDataManagerProtocol

    init(dataManager: CharacterDetailDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getCharacter(characterId: Int, completion: @escaping (Result<Character, APIError>) -> Void) {
        dataManager.getCharacter(characterId: String(characterId)) { result in
            switch result {
            case .success(let destinations):
                completion(.success(destinations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getEpisode(url: String, completion: @escaping (Result<CharacterEpisode, APIError>) -> Void) {
        dataManager.getEpisode(url: url) { result in
            switch result {
            case .success(let episode):
                completion(.success(episode))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func cancelTask(for url: String) {
        dataManager.cancelTask(for: url)
    }
}
