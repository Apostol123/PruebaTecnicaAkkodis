import UIKit

class CharacterDetailBuilder: Builder {
    private var coordinatorOutput: (CharacterDetailOutput) -> Void
    
    init(coordinnatorOutput: @escaping (CharacterDetailOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = CharacterDetailDataManager()
        let interactor = CharacterDetailInteractor(dataManager: dataManager)
        let presenter = CharacterDetailPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = CharacterDetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
