//
//  CrearSubastaViewController.swift
//  Subastator
//
//  Created by xavipandis on 04/04/2017.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CrearSubastaViewController: UIViewController {
    
    var subastasRef: FIRDatabaseReference!

    @IBOutlet weak var nombreSubasta: UITextField!
    @IBOutlet weak var objeto: UITextField!
    @IBOutlet weak var descripcionProducto: UITextView!
    @IBOutlet weak var precioMinimo: UITextField!
    @IBAction func crearSubasta(_ sender: UIButton) {
        
        let key = subastasRef.childByAutoId().key
        
        let nombre_subasta:String = nombreSubasta.text!
        let objeto_subasta:String = objeto.text!
        let descripcion_producto_subasta:String = descripcionProducto.text
        let precio_minimo_subasta:String = precioMinimo.text!
        let credentials = UserDefaults.standard
        let creator = credentials.string(forKey: userCredentials.usr)
        
        let subasta = ["nombre_subasta": nombre_subasta,
                       "objeto_subasta": objeto_subasta,
                       "descripcion_subasta": descripcion_producto_subasta,
                       "precio_minimo_subasta": precio_minimo_subasta,
                       "creador": creator]
        
        subastasRef.observe(FIRDataEventType.value, with: { (snapshot) in
            let childUpdates = ["/subastas/\(key)": subasta]
            ref.updateChildValues(childUpdates)
            
        })

        let panelViewController: PanelViewController = self.storyboard?.instantiateViewController(withIdentifier: "PanelViewController") as! PanelViewController
        self.show(panelViewController, sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        subastasRef = ref.child("subastas")
        // Do any additional setup after loading the view.
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
