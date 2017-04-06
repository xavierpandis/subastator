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
        
        var exists = false;
        var count = 0;
        let key = ref.child("user").childByAutoId().key
        
        print(usuario)
        print(contraseña)
        
        var handle: UInt = 0
        
        handle = userRef.observe(FIRDataEventType.value, with: { (snapshot) in
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
                let childUpdates = ["\(key)": post]
                self.userRef.updateChildValues(childUpdates)
                self.userRef.removeObserver(withHandle: handle)
            } else {
                let alertController = UIAlertController(title: "¡Atención!", message:
                    "Ya existe un usuario con el mismo nombre, por favor escoge otro.", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
                self.inputUsuario.text = ""
                self.inputContraseña.text = ""
            }
            
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userRef = ref.child("user")
        
        
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
