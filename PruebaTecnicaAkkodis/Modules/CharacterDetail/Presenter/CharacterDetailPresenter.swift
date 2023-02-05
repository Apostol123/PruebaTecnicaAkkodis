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
        interactor.getCharacters(characterId: characterId) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
