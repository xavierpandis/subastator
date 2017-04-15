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

struct userCredentials {
    static let usr = "username"
}

class FirstViewController: UIViewController {
    
    var userRef: FIRDatabaseReference!
    
    @IBOutlet weak var usuario: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var condition: UILabel!
    @IBAction func login(_ sender: UIButton) {

        let usuarioUsr = usuario.text!
        let passwordPsw = password.text!
        
        userRef.observe(FIRDataEventType.value, with: { (snapshot) in
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? FIRDataSnapshot {
                let value = rest.value as? NSDictionary
                if (value?["login"] as? String == usuarioUsr && value?["password"] as? String == passwordPsw){
                    let panelViewController: PanelViewController = self.storyboard?.instantiateViewController(withIdentifier: "PanelViewController") as! PanelViewController
                    self.show(panelViewController, sender: self)
                }
            }
        })
        
        let userSession = UserDefaults.standard
        userSession.set(usuarioUsr, forKey: userCredentials.usr)
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

