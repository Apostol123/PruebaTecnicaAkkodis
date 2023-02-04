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
    func viewDidLoad() {
        interactor.getCharacters { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
