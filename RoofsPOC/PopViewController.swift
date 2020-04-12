import UIKit

class PopViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if #available(iOS 13.0, *) {
            if let presentationController = navigationController?.popoverPresentationController {
                navigationController!
                    .popoverPresentationController!.delegate!.presentationControllerDidDismiss!(presentationController)
            }

        }
    }
}
