import Foundation

protocol CharacterDetailDataManagerProtocol: AnyObject {
    func getCharacter(characterId: String, completion: @escaping (Result<Character, APIError>) -> Void)
    func getEpisode(url: String, completion: @escaping (Result<CharacterEpisode, APIError>) -> Void)
    func cancelTask(for url: String)
}
