import Foundation

protocol CharacterListDataManagerProtocol: AnyObject {
    func getCharacters(completion: @escaping (Result<DtoCharacterList, APIError>) -> Void)
}
