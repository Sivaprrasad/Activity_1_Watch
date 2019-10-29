//
//  InterfaceController.swift
//  WatchKitDemo-F19 WatchKit Extension
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity // need this to send mesasges between Phone and Watch


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    // Function to receive DICTIONARY from the watch
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Output message to terminal
        print("WATCH: I received a message: \(message)")
        
        // Get the "name" key out of the dictionary
        // and show it in the label
        let name = message["name"] as! String
        let color = message["color"] as! String
        
        msgFromPhoneName.setText(name)
        msgFromPhoneColor.setText(color)

        
    }

    // MARK: Outlets
    
    // Label for output
    @IBOutlet weak var outputLabel: WKInterfaceLabel!
    
    // Message from phone goes in this label
    
    @IBOutlet weak var msgFromPhoneName: WKInterfaceLabel!
    
    @IBOutlet weak var msgFromPhoneColor: WKInterfaceLabel!
    
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
        
        if (WCSession.isSupported() == true) {
            msgFromPhoneName.setText("WC is supported!")
            
            // create a communication session with the phone
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            msgFromPhoneName.setText("WC NOT supported!")
        }
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Custom functions

    // Do something when user presses watch button
    
    @IBAction func sendMessageToPhoneButton() {
        print("Sending message to Phone")
               // ------ SEND MESSAGE TO WATCH CODE GOES HERE
               if (WCSession.default.isReachable == true) {
                   // Here is the message you want to send to the watch
                   // All messages get sent as dictionaries
                   let message = ["name":"Pritesh",
                   "age":"18"] as [String : Any]
                   
                   // Send the message
               WCSession.default.sendMessage(message, replyHandler:nil)
                  
               }
    }
    
    
    
    
    
    
    
    
    

}
