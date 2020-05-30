//
//  JumpView.swift
//  Lowl
//
//  Created by Kelvin Aoe on 30/05/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//
import UIKit

class JumpView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.performSegue(withIdentifier: "FromID", sender: self)
            
    })
            
    }
    

}
