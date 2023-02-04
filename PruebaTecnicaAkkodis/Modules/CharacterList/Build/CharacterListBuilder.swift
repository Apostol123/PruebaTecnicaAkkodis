import UIKit

class CharacterListBuilder: Builder {
    private var coordinatorOutput: (CharacterListOutput) -> Void
    
    init(coordinnatorOutput: @escaping (CharacterListOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = CharacterListDataManager()
        let interactor = CharacterListInteractor(dataManager: dataManager)
        let presenter = CharacterListPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = CharacterListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
