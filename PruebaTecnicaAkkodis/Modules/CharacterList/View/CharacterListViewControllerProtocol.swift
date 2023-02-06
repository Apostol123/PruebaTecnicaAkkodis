import UIKit

protocol CharacterListViewProtocol: Loader, NoDataLayout {
    func layout(with character: [Character])
}
