import Foundation

class CharacterDetailDataManager: CharacterDetailDataManagerProtocol {
    private let serviceProxy = ServiceProxy()
      
    func getCharacter(characterId: String, completion: @escaping (Result<Character, APIError>) -> Void) {
          serviceProxy.getItem(url: Endpoint.mainURL.rawValue+"/\(characterId)", type: Character.self) { result in
              switch result {
              case .success(let character):
                  completion(.success(character))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
      }
    
    func getEpisode(url: String, completion: @escaping (Result<CharacterEpisode, APIError>) -> Void) {
        if serviceProxy.shouldPerformTask(for: url) {
            serviceProxy.getItem(shouldTrackTask: true, url: url, type: CharacterEpisode.self) { result in
                switch result {
                case .success(let episode):
                    completion(.success(episode))
                case .failure(let failure):
                    completion(.failure(failure))
                }
            }
        }
    }
    
    func cancelTask(for url: String) {
        serviceProxy.cancelTask(for: url)
    }
}
