
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var eyeKanan: UIImageView!
    @IBOutlet weak var eyeKiri: UIImageView!
    @IBOutlet weak var eyeballKanan: UIImageView!
    @IBOutlet weak var eyeballKiri: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          titleText.font = .preferredFont(forTextStyle: .largeTitle)
          titleText.adjustsFontForContentSizeCategory = true
        
            startButton.titleLabel?.font = .preferredFont(forTextStyle: .title2)
        startButton.titleLabel?.textAlignment = NSTextAlignment.center
            startButton.titleLabel?.adjustsFontForContentSizeCategory = true
            
          
            reminderButton.titleLabel?.font = .preferredFont(forTextStyle: .title2 )
        reminderButton.titleLabel?.textAlignment = NSTextAlignment.center
            reminderButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        
        aboutButton.adjustsImageSizeForAccessibilityContentSizeCategory = true
        aboutButton.titleLabel?.font = .preferredFont(forTextStyle: .title2)
        aboutButton.titleLabel?.textAlignment = NSTextAlignment.center
        aboutButton.titleLabel?.numberOfLines = 0
        aboutButton.titleLabel?.lineBreakMode = .byWordWrapping
        aboutButton.titleLabel?.adjustsFontForContentSizeCategory = true
        eyeKanan.image?.isAccessibilityElement = true
        eyeKiri.image?.isAccessibilityElement = true
        eyeballKanan.image?.isAccessibilityElement = true
        eyeballKiri.image?.isAccessibilityElement = true
    }
    

}
