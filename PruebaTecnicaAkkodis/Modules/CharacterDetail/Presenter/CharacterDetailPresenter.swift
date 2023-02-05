import Foundation

class CharacterDetailPresenter {
    private var interactor: CharacterDetailInteractorProtocol
    weak var view: CharacterDetailViewProtocol?
    private var coordinatorOutput: (CharacterDetailOutput) -> Void

    init(interactor: CharacterDetailInteractorProtocol, coordinnatorOutput: @escaping (CharacterDetailOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
}
