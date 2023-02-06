import UIKit

protocol CharacterDetailViewProtocol: Loader, NoDataLayout {
    func layout(with character: Character)
}
