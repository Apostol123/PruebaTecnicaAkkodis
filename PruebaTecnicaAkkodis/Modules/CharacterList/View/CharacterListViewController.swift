import UIKit

class CharacterListViewController: UIViewController {
    private let presenter: CharacterListPresenterProtocol
    
    private var content: [Character] = [] {
           didSet {
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
       }
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.register(CharacterListTableViewCell.self, forCellReuseIdentifier: CharacterListTableViewCell.identifier)
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
        
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
        setUpTableViewLayout()
        presenter.viewDidLoad()
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

extension CharacterListViewController: CharacterListViewProtocol {
    func layout(with character: [Character]) {
        content = character
    }
}

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = content[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListTableViewCell.identifier, for: indexPath) as?  CharacterListTableViewCell else {return UITableViewCell()}
        cell.configure(titleDescription: item.name, description: item.species.rawValue, imageURL: item.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = content[indexPath.row]
    }
}
