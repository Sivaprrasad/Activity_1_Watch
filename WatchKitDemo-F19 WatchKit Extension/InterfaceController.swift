//
//  InterfaceController.swift
//  WatchKitDemo-F19 WatchKit Extension
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    // MARK: Outlets
    
    // Label for output
    @IBOutlet weak var outputLabel: WKInterfaceLabel!
    
    // Message from phone goes in this label
    
    @IBOutlet weak var msgFromPhoneLabel: WKInterfaceLabel!
    
    
    // MARK: Variables
    var count:Int = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("---WATCH APP LOADED")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Custom functions

    // Do something when user presses watch button
    @IBAction func watchButtonPressed() {
        print("I CLICKED THE BUTTON")
        self.count = self.count + 1
        self.outputLabel.setText("LMAO! \(self.count)")
    }
    
    
    
    
    
    
    
    
    

}
