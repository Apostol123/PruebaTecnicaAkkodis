import Foundation

protocol CharacterDetailDataManagerProtocol: AnyObject {
    func getCharacters(characterId: String, completion: @escaping (Result<Character, APIError>) -> Void)
}
