import Foundation

protocol CharacterListInteractorProtocol: AnyObject {
    func getCharacters(completion: @escaping (Result<DtoCharacterList, APIError>) -> Void)
}
