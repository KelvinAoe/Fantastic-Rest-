//
//  OnboardViewController.swift
//  Lowl
//
//  Created by Hesti Andriani on 11/06/20.
//  Copyright © 2020 Kelvin Aoe. All rights reserved.
//

import Foundation
import UIKit

class OnboardViewController: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var subOneLabel: UILabel!
    @IBOutlet weak var subTwoLabel: UILabel!
    @IBOutlet weak var subThreeLabel: UILabel!
    @IBOutlet weak var bodyOneLabel: UILabel!
    @IBOutlet weak var bodyTwoLabel: UILabel!
    @IBOutlet weak var bodyThreeLabel: UILabel!
    @IBOutlet weak var contButton: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//Continue Button
        contButton.adjustsFontForContentSizeCategory = true
        contButton.isAccessibilityElement = true
        contButton.font = .preferredFont(forTextStyle: .largeTitle)
        contButton.textAlignment = NSTextAlignment.center
        
//Welcome
        welcomeLabel.adjustsFontForContentSizeCategory = true
        welcomeLabel.isAccessibilityElement = true
        welcomeLabel.font = .preferredFont(forTextStyle: .largeTitle)
        welcomeLabel.textAlignment = NSTextAlignment.center
        
//Subtitle 1
        subOneLabel.adjustsFontForContentSizeCategory = true
        subOneLabel.isAccessibilityElement = true
        subOneLabel.font = .preferredFont(forTextStyle: .title1)
        
//Body 1
        bodyOneLabel.adjustsFontForContentSizeCategory = true
        bodyOneLabel.isAccessibilityElement = true
        bodyOneLabel.font = .preferredFont(forTextStyle: .body)
        
//Subtitle 2
        subTwoLabel.adjustsFontForContentSizeCategory = true
        subTwoLabel.isAccessibilityElement = true
        subTwoLabel.font = .preferredFont(forTextStyle: .title1)
        
//Body 2
        bodyTwoLabel.adjustsFontForContentSizeCategory = true
        bodyTwoLabel.isAccessibilityElement = true
        bodyTwoLabel.font = .preferredFont(forTextStyle: .body)
        
//Subtitle 3
        subThreeLabel.adjustsFontForContentSizeCategory = true
        subThreeLabel.isAccessibilityElement = true
        subThreeLabel.font = .preferredFont(forTextStyle: .title1)
        
//Body 3
        bodyThreeLabel.adjustsFontForContentSizeCategory = true
        bodyThreeLabel.isAccessibilityElement = true
        bodyThreeLabel.font = .preferredFont(forTextStyle: .body)

    }
    

}
