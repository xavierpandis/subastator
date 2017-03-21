//
//  RegistroViewController.swift
//  Subastator
//
//  Created by xavipandis on 16/03/2017.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RegistroViewController: UIViewController {
    
    var userRef: FIRDatabaseReference!

    @IBOutlet weak var inputUsuario: UITextField!
    @IBOutlet weak var inputContraseña: UITextField!
    @IBAction func btnCrearCuenta(_ sender: AnyObject) {
        let usuario:String = inputUsuario.text!
        let contraseña:String = inputContraseña.text!
        var ok = false
        if (usuario != nil || usuario != "") {
            print("Usuario: "+usuario)
            ok = true
        }
        else {
          ok = false
        }
        
        if(contraseña != nil || contraseña != ""){
           print("Contraseña: "+contraseña)
            ok = true
        }else{
            ok = false
        }
        
        if ok == true {
            
            var exists = false;
            
            let key = ref.child("user").childByAutoId().key
            
            print(usuario)
            print(contraseña)
            
            userRef.observe(FIRDataEventType.value, with: { (snapshot) in
                let enumerator = snapshot.children
                while let rest = enumerator.nextObject() as? FIRDataSnapshot {
                    let value = rest.value as? NSDictionary
                    if value?["login"] as? String == usuario {
                        exists = true
                    }
                }
                
                if !exists {
                    let post = ["login": usuario,
                                "password": contraseña]
                    let childUpdates = ["/user/\(key)": post]
                    ref.updateChildValues(childUpdates)
                }
                
            })
           
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userRef = ref.child("user")
        userRef.observe(FIRDataEventType.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            var login = value?["login"] as? String ?? ""
            var pass = value?["password"] as? String ?? ""
            print("login " + login + ", password "+pass)
            //self.condition.text = postDict as! String?
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
