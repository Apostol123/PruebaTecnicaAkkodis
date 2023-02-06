import Foundation

protocol CharacterDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func loadCellEpisodeData(for url: String, completion: @escaping (CharacterEpisode) -> Void)
    func cancelTask(for url: String)
}
