
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    startButton.titleLabel?.adjustsFontForContentSizeCategory = true
    reminderButton.titleLabel?.adjustsFontForContentSizeCategory = true
    aboutButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
      
    }
    

}
