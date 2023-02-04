import UIKit

protocol Loader: AnyObject {
    func showLoader()
    func hideLoader()
}

extension Loader where Self: UIViewController {
    func showLoader() {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.heightAnchor.constraint(equalToConstant: 40).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 40).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        activityIndicator.tag = 1002
        
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            for view in self.view.subviews {
                if view.tag == 1002 {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
