import UIKit

protocol NoDataLayout: AnyObject {
    func addNoDataView(description: String?)
    func removeView()
}

extension NoDataLayout where Self: UIViewController {
    func addNoDataView(description: String?) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            for view in self.view.subviews {
                view.removeFromSuperview()
            }
            
            let noDataView = NoDataView(frame: .zero)
            noDataView.tag = 3009
            noDataView.configure(with: description ?? "lng.common.noDataView.message".localized)
            self.view.addSubview(noDataView)
            noDataView.translatesAutoresizingMaskIntoConstraints = false
            noDataView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            noDataView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
            noDataView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
            noDataView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }
        
    }
    
    func removeView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.view.subviews.first(where: {$0.tag == 3009})?.removeFromSuperview()
        }
    }
}
