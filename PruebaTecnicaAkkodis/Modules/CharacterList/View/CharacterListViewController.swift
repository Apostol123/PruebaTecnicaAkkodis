import UIKit

class CharacterListViewController: UIViewController {
    private let presenter: CharacterListPresenterProtocol
        
    init (presenter: CharacterListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension CharacterListViewController: CharacterListViewProtocol {
}
