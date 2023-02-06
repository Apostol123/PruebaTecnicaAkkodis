import Foundation

class CharacterDetailPresenter {
    private var interactor: CharacterDetailInteractorProtocol
    weak var view: CharacterDetailViewProtocol?
    private var coordinatorOutput: (CharacterDetailOutput) -> Void
    private let characterId: Int

    init(characterId: Int, interactor: CharacterDetailInteractorProtocol, coordinnatorOutput: @escaping (CharacterDetailOutput) -> Void) {
        self.characterId = characterId
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    func viewDidLoad() {
        view?.showLoader()
        interactor.getCharacter(characterId: characterId) {[weak self] result in
            self?.view?.hideLoader()
            switch result {
            case .success(let character):
                self?.view?.layout(with: character)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func loadCellEpisodeData(for url: String, completion: @escaping (CharacterEpisode) -> Void) {
        interactor.getEpisode(url: url) {[weak self] result in
            switch result {
            case .success(let episode):
                completion(episode)
            case .failure(_):
                self?.view?.addNoDataView(description: nil)
            }
        }
    }
    
    func cancelTask(for url: String) {
        interactor.cancelTask(for: url)
    }
}
