//
//  ViewController.swift
//  Common
//
//  Created by wwj on 03/25/2024.
//  Copyright (c) 2024 wwj. All rights reserved.
//

import UIKit
import Common

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let star = "ddgdsdada"
        if star.isValidPhoneNumber {
            print("")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

