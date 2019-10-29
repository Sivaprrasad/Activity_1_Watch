//
//  ViewController.swift
//  WatchKitDemo-F19
//
//  Created by MacStudent on 2019-10-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import WatchConnectivity  // built in library for making Phone <> Watch communication work

class ViewController: UIViewController, WCSessionDelegate {
    
    // Built-in methods for dealing with communication between Watch <> Phone
    // ------------------------------------------------
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Output message to terminal
        print("WATCH: I received a message: \(message)")
        
        // Get the "name" key out of the dictionary
        // and show it in the label
        let name = message["name"] as! String
        let age = message["age"] as! String
        
        msgFromWatchName.text = name
        msgFromWatchAge.text = age

        
    }
    
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    

    // MARK: Outlets
    // ------------------------
    @IBOutlet weak var msgFromWatchName: UILabel!
    
    @IBOutlet weak var msgFromWatchAge: UILabel!
    
    
    // MARK: Variables
    // ------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---PHONE APP LOADED!")
        
        // @TODO: Does the phone support communication with the watch?
        if (WCSession.isSupported() == true) {
            msgFromWatchName.text = "WC is supported!"
            
            // create a communication session with the watch
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            msgFromWatchName.text = "WC NOT supported!"
        }
    }

    
    // MARK: Custom Functions
    // ------------------------

    
    // When you press button, send a message to watch
    @IBAction func sendMessageToWatchButton(_ sender: Any) {
        print("Sending message to watch")
        // ------ SEND MESSAGE TO WATCH CODE GOES HERE
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["name":"Banana",
            "color":"Yellow"] as [String : Any]
            
            // Send the message
        WCSession.default.sendMessage(message, replyHandler:nil)
           
        }
    
        
        
        // -----------------------------------------------
        
    }
    
    
    
}

