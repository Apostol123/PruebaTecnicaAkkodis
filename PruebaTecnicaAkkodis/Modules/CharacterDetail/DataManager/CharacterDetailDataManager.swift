import Foundation

class CharacterDetailDataManager: CharacterDetailDataManagerProtocol {
    private let serviceProxy = ServiceProxy()
      
    func getCharacters(characterId: String, completion: @escaping (Result<Character, APIError>) -> Void) {
          serviceProxy.getItem(url: Endpoint.mainURL.rawValue+"/\(characterId)", type: Character.self) { result in
              switch result {
              case .success(let destinations):
                  completion(.success(destinations))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
      }
}
