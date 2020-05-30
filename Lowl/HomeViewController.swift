
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                          self.performSegue(withIdentifier: "FromID", sender: self)
                  
                    })
    }
    

}
