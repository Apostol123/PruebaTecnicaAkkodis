import UIKit
import SDWebImage

class CharacterListTableViewCell: UITableViewCell {
    static let identifier = String(describing: CharacterListTableViewCell.self)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var titleDescription: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    
    private lazy var textStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [titleLabel, titleDescription, subtitleLabel, descriptionLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainImage, textStackView])
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 12
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
    
    func configure(titleDescription: String, description: String, imageURL: String) {
        self.titleDescription.text = titleDescription
        descriptionLabel.text = description
        subtitleLabel.isHidden = description.isEmpty
        mainImage.sd_setImage(with: URL(string: imageURL), placeholderImage: nil)
        
    }
}
