import Foundation

class CharacterListDataManager: CharacterListDataManagerProtocol {
    private let serviceProxy = ServiceProxy()
      
      func getCharacters(completion: @escaping (Result<DtoCharacterList, APIError>) -> Void) {
          serviceProxy.getItem(url: Endpoint.mainURL.rawValue, type: DtoCharacterList.self) { result in
              switch result {
              case .success(let characters):
                  completion(.success(characters))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
      }
}
