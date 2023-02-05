import UIKit


class CharacterEpisodeTableViewCell: UITableViewCell {
    static let id = String(describing: CharacterEpisodeTableViewCell.self)
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    

    private lazy var airDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var episodeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    
    private lazy var mainStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [nameLabel, airDateLabel, episodeLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16).isActive = true
        mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        self.selectionStyle = .none
    }
    
    func configure(name: String, airdate: String, episode: String) {
        self.nameLabel.text = name
        self.airDateLabel.text = airdate
        self.episodeLabel.text = episode
    }
}
