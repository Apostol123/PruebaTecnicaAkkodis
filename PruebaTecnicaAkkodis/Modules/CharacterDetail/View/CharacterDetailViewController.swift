import UIKit

class CharacterDetailViewController: UIViewController {
    private let presenter: CharacterDetailPresenterProtocol
        
    init (presenter: CharacterDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CharacterDetailViewController: CharacterDetailViewProtocol {
}
