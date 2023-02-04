import UIKit

class CharacterListTableViewCell: UITableViewCell {
    static let identifier = String(describing: CharacterListTableViewCell.self)
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: Font.semibold.rawValue, size: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont(name: Font.medium.rawValue, size: 14)
        label.textColor = .black
        return label
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
        
    }
}
