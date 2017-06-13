//
//  SubastaDetailController.swift
//  Subastator
//
//  Created by Javier Bono Parra on 24/5/17.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SubastaDetailController: UIViewController {
    var passedValue: Subasta!
    var pujas: FIRDatabaseReference!

    @IBOutlet weak var tituloLabel: UILabel!

    @IBOutlet weak var precioSalidaLabel: UILabel!
    
    @IBOutlet weak var objetoSubastaLabel: UILabel!
    
    @IBOutlet weak var subastadorLabel: UILabel!
    
    @IBOutlet weak var precioActualLabel: UILabel!
    
    @IBOutlet weak var descripcionText: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        tituloLabel.text = passedValue._nombre_subasta
        precioSalidaLabel.text = passedValue._precio_minimo_subasta
        objetoSubastaLabel.text = passedValue._objeto_subasta
        subastadorLabel.text = passedValue._creador
        descripcionText.text = passedValue._descripcion_subasta
        */
        pujas = ref.child("subastas/"+passedValue._id+"/pujas")
        
        pujas.observe(FIRDataEventType.value, with: { (snapshot) in
            let enumerator = snapshot.children
            if let result = enumerator.allObjects as? [FIRDataSnapshot] {
                for child in result {
                    print(child)
                }
            }
        })

       /* pujas.observeSingleEvent(of: .value) { (snapshot) in
            if let result = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for child in result {
                    print(child)
                }
            }
        }*/
        
        
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
