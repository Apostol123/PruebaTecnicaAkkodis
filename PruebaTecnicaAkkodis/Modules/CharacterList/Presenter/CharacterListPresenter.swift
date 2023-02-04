import Foundation

class CharacterListPresenter {
    private var interactor: CharacterListInteractorProtocol
    weak var view: CharacterListViewProtocol?
    private var coordinatorOutput: (CharacterListOutput) -> Void

    init(interactor: CharacterListInteractorProtocol, coordinnatorOutput: @escaping (CharacterListOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension CharacterListPresenter: CharacterListPresenterProtocol {
}
