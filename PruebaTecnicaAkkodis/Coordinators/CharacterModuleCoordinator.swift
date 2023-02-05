import UIKit

class CharacterModuleCoordinator: Coordinator {
    enum CharacterModuleCoordinatorState {
        case initial
        case willShowCharactList
        case didShowCharacterList(id: Int)
        case willShowCharacterDetail(id: Int)
    }
    
    private var currentState: CharacterModuleCoordinatorState
    private let navigator: UINavigationController
    
    init(on navigator: UINavigationController) {
        self.navigator = navigator
        currentState = .initial
    }
    
    func start() {
        loop()
    }
    
    private func loop() {
        switch next(nextState: currentState) {
        case .willShowCharactList:
            willShowCharacterListModule()
        
        case .willShowCharacterDetail(let id):
            willShowCharacterDetail(with: id)
            
        default: fatalError("Case \(next(nextState: currentState)) not supported in this coordinator")
        }
    }
    
    private func next(nextState: CharacterModuleCoordinatorState) -> CharacterModuleCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowCharactList
        
        case .didShowCharacterList(let id):
            return .willShowCharacterDetail(id: id)
            
        default: return nextState
        }
    }
    
    private func willShowCharacterListModule() {
        let viewController = CharacterListBuilder {[weak self] output in
            switch output {
            case .goToCharacterList(let id):
                self?.currentState = .didShowCharacterList(id: id)
                self?.loop()
            }
        }.build()
        navigator.setViewControllers([viewController], animated: false)
    }
    
    private func willShowCharacterDetail(with id: Int) {
        let viewController = CharacterDetailBuilder(characterId: id) {_ in
        }.build()
        
        navigator.pushViewController(viewController, animated: true)
    }
}
