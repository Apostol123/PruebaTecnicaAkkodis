import Foundation

protocol CharacterListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectCharacter(id: Int)
}
