import UIKit

class CharacterDetailBuilder: Builder {
    private var coordinatorOutput: (CharacterDetailOutput) -> Void
    private let characterId: Int
    
    init(characterId: Int, coordinnatorOutput: @escaping (CharacterDetailOutput) -> Void) {
        self.characterId = characterId
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = CharacterDetailDataManager()
        let interactor = CharacterDetailInteractor(dataManager: dataManager)
        let presenter = CharacterDetailPresenter(characterId: characterId, interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = CharacterDetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
