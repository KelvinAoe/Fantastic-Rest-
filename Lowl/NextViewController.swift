//
//  FirstViewController.swift
//  Lowl
//
//  Created by Muhammad Harviando on 11/05/20.
//  Copyright © 2020 Muhammad Harviando. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.performSegue(withIdentifier: "NextId", sender: self)
              })
    }
    

}

