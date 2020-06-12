//
//  about.swift
//  Lowl
//
//  Created by Eci AL on 12/06/20.
//  Copyright © 2020 Kelvin Aoe. All rights reserved.
//

import Foundation
import UIKit

class AboutController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    @IBOutlet weak var aboutLable: UILabel!
    @IBOutlet weak var firstLable: UILabel!
    @IBOutlet weak var secondLable: UILabel!
    @IBOutlet weak var thirdLable: UILabel!
    @IBOutlet weak var fantasticLable: UILabel!
    
    func updateFonts() {
        aboutLable.font = .preferredFont(forTextStyle: .largeTitle)
        aboutLable.adjustsFontForContentSizeCategory = true
        firstLable.font = .preferredFont(forTextStyle: .title2)
        firstLable.adjustsFontForContentSizeCategory = true
        secondLable.font = .preferredFont(forTextStyle: .title2)
        secondLable.adjustsFontForContentSizeCategory = true
        thirdLable.font = .preferredFont(forTextStyle: .title2)
        thirdLable.adjustsFontForContentSizeCategory = true
        fantasticLable.font = .preferredFont(forTextStyle: .title2)
        fantasticLable.adjustsFontForContentSizeCategory = true
        
    }
}
