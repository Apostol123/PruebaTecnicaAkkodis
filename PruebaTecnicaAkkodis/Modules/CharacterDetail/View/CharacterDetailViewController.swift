import UIKit
import SDWebImage

class CharacterDetailViewController: UIViewController {
    private let presenter: CharacterDetailPresenterProtocol
    private var episdodeURL: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .bottom, animated: true)
            }
        }
    }
    
    private var episodes: [CharacterEpisode] = []
    
    private lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        return image
    }()
    
    private lazy var mainStackView: UIStackView = {
        let freeSpaceView = UIView(frame: .zero)
        let stackView = UIStackView(arrangedSubviews: [characterImage, tableView, freeSpaceView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var tableView: ContentSizedTableView = {
        let view = ContentSizedTableView(frame: .zero)
        view.register(CharacterEpisodeTableViewCell.self, forCellReuseIdentifier: CharacterEpisodeTableViewCell.id)
        view.dataSource = self
        view.delegate = self
        view.prefetchDataSource = self
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
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
        view.backgroundColor = .white
    }
    
    private func setUpMainStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setTitle(with title: String) {
        DispatchQueue.main.async {
            self.title = title
        }
    }
}

extension CharacterDetailViewController: CharacterDetailViewProtocol {
    func layout(with character: Character) {
        characterImage.sd_setImage(with:  URL(string: character.image))
        episdodeURL = character.episode
        setTitle(with: character.name)
    }
}


extension CharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episdodeURL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterEpisodeTableViewCell.id , for: indexPath) as! CharacterEpisodeTableViewCell
        let episodeURL = episdodeURL[indexPath.row]
        
        if !episodes.isEmpty, episodes.count > indexPath.row {
            let episode = episodes[indexPath.row]
            let episodeName = "lng.common.name".localized.replacingOccurrences(of: "@", with: episode.name)
            let airdate = "lng.common.airdate".localized.replacingOccurrences(of: "@", with: episode.airDate)
            let episodeNumber = "lng.common.chapter.number".localized.replacingOccurrences(of: "@", with: episode.episode)
            cell.configure(name: episodeName, airdate: airdate, episode: episodeNumber)
        } else {
            
            presenter.loadCellEpisodeData(for: episodeURL) { episode in
                DispatchQueue.main.async {
                    let episodeName = "lng.common.name".localized.replacingOccurrences(of: "@", with: episode.name)
                    let airdate = "lng.common.airdate".localized.replacingOccurrences(of: "@", with: episode.airDate)
                    let episodeNumber = "lng.common.chapter.number".localized.replacingOccurrences(of: "@", with: episode.episode)
                    cell.configure(name: episodeName, airdate: airdate, episode: episodeNumber)
                    if !self.episodes.contains(where: {$0.id == episode.id}) {
                        self.episodes.append(episode)
                        tableView.reloadData()
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "lng.common.episodes".localized
    }
}

extension CharacterDetailViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            let episodeURL = episdodeURL[indexPath.row]
            presenter.loadCellEpisodeData(for: episodeURL) { episode in
                DispatchQueue.main.async {
                    if !self.episodes.contains(where: {$0.id == episode.id}) {
                        self.tableView.reloadRows(at: [indexPath], with: .fade)
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach {[weak self] in
            self?.presenter.cancelTask(for: episdodeURL[$0.row])
        }
    }
}
