

import UIKit

class ViewController: UIViewController, UIAdaptivePresentationControllerDelegate {

    @IBOutlet weak var button: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let version = Float(UIDevice.current.systemVersion), version < 13.0 {
            print("do the thing here")
        }
    }
    
    @objc func dismissModal() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func showPopover(_ sender: Any) {
        let vc = PopViewController()
        let button = UIButton()

        button.setTitle("DISMISS", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
    
        vc.view.addSubview(button)
        
        NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: vc.view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: vc.view, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        vc.view.backgroundColor = .red

        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .popover
        
        let popover = navController.popoverPresentationController
        popover?.sourceView = self.button
        popover?.sourceRect = self.button.bounds
        
        if #available(iOS 13.0, *) {
            navController.presentationController?.delegate = self
            //  prevents swipe to dismiss
            navController.isModalInPresentation = true
        }
        
        self.present(navController, animated: true, completion: nil)
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("Do the thing here")
    }
}

