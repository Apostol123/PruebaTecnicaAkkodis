import Foundation

protocol CharacterDetailInteractorProtocol: AnyObject {
    func getCharacter(characterId: Int, completion: @escaping (Result<Character, APIError>) -> Void)
    func getEpisode(url: String, completion: @escaping (Result<CharacterEpisode, APIError>) -> Void)
}
