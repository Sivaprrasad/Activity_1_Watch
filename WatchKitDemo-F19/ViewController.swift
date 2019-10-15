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
    
    @IBOutlet weak var sendMessageOutputLabel: UILabel!
    // MARK: Variables
    // ------------------------
    var phoneCounter:Int = 0
    var messageCounter:Int = 0
    
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
    
    // When you press button, send a message to watch
    @IBAction func sendMessageButton(_ sender: Any) {
        print("Sending message to watch")
        // ------ SEND MESSAGE TO WATCH CODE GOES HERE

        
        
        // -----------------------------------------------
        messageCounter = messageCounter + 1
        sendMessageOutputLabel.text = "Message Sent \(messageCounter)"
    }
    
    
    
}

