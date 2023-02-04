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
        view?.showLoader()
        interactor.getCharacters {[weak self] result in
            self?.view?.hideLoader()
            switch result {
            case .success(let success):
                self?.view?.layout(with: success.results)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
