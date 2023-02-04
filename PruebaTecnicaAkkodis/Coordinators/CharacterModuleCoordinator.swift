import UIKit

class CharacterModuleCoordinator: Coordinator {
    enum CharacterModuleCoordinatorState {
        case initial
        case willShowCharactList
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
            
        default: fatalError("Case \(next(nextState: currentState)) not supported in this coordinator")
        }
    }
    
    private func next(nextState: CharacterModuleCoordinatorState) -> CharacterModuleCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowCharactList
            
        default: return nextState
        }
    }
    
    private func willShowCharacterListModule() {
        let viewController = CharacterListBuilder { _ in
            
        }.build()
        navigator.setViewControllers([viewController], animated: false)
    }
}
