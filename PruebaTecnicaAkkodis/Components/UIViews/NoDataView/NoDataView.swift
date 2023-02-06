import UIKit


class NoDataView: UIView {
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 32)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpInfoLabelLayout()
        backgroundColor = .white
    }
    
    private func setUpInfoLabelLayout() {
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    func configure(with infoLabelDescription: String) {
        infoLabel.text = infoLabelDescription
    }
}
