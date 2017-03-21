//
//  FirstViewController.swift
//  Subastator
//
//  Created by xavipandis on 09/02/2017.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit
import FirebaseDatabase

var ref: FIRDatabaseReference!

class FirstViewController: UIViewController {
    
    var conditionRef: FIRDatabaseReference!
    var userRef: FIRDatabaseReference!
    
    @IBOutlet weak var condition: UILabel!
    @IBAction func login(_ sender: UIButton) {
        /*let secondViewController: SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.show(secondViewController, sender: self)*/
        
        conditionRef.setValue("LOGIN")
    }
    @IBAction func reg(_ sender: AnyObject) {
        conditionRef.setValue("REGISTRAR")
        
        let key = ref.child("user").childByAutoId().key
        
        let post = ["login": "dsad",
                    "password": "dsad"]
        let childUpdates = ["/user/\(key)": post]
        ref.updateChildValues(childUpdates)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = FIRDatabase.database().reference()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        userRef = ref.child("user")
        
        userRef.observe(FIRDataEventType.value, with: { (snapshot) in
            print(snapshot)
            var data = snapshot.value
            
            /*let value = snapshot.value as? NSDictionary
            var login = value?["login"] as? String ?? ""
            var pass = value?["password"] as? String ?? ""
            print("login " + login + ", password "+pass)*/
            //self.condition.text = postDict as! String?
        })

    
    }


}

