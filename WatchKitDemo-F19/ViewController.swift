//
//  ViewController.swift
//  WatchKitDemo-F19
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    // ------------------------
    @IBOutlet weak var counterLabel: UILabel!
    
    // MARK: Variables
    // ------------------------
    var phoneCounter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---PHONE APP LOADED!")
    }

    
    // MARK: Custom Functions
    // ------------------------
    @IBAction func phoneButtonPressed(_ sender: UIButton) {
        
        print("PHONE BUTTON PRESSED")
        self.phoneCounter = self.phoneCounter + 1;
        self.counterLabel.text = "Counter: \(self.phoneCounter)"
        
    }
    
}

