import UIKit

class CharacterDetailViewController: UIViewController {
    private let presenter: CharacterDetailPresenterProtocol
    
    private lazy var characterImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        return image
    }()
    
    private lazy var mainStackView: UIStackView = {
        let freeSpaceView = UIView(frame: .zero)
        let stackView = UIStackView(arrangedSubviews: [characterImage, freeSpaceView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    init (presenter: CharacterDetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainStackViewLayout()
        presenter.viewDidLoad()
    }
    
    private func setUpMainStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension CharacterDetailViewController: CharacterDetailViewProtocol {
}
