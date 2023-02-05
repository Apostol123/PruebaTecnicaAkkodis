import Foundation

protocol CharacterDetailInteractorProtocol: AnyObject {
    func getCharacters(characterId: Int, completion: @escaping (Result<Character, APIError>) -> Void)
}
