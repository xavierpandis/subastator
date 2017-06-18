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
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "backgroundpicture.png")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        pujas = ref.child("subastas/"+passedValue._id+"/pujas/puja")
        
        pujas.observe(FIRDataEventType.value, with: { (snapshot) in let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? FIRDataSnapshot {
                let value = rest.value as? NSDictionary
                
                let sub = Puja(dinero: value?["dinero"] as! String, pujador: value?["pujador"] as! String)
                
                print("DINERO: \(sub._dinero)")
                print("PUJADOR: \(sub._pujador)")
            
            /*let enumerator = snapshot.children
            if let result = enumerator.allObjects as? [FIRDataSnapshot] {
                for child in result {
                    print("--- CHILD ---")
                    print(child)
                }*/
            }
        })
        
        tituloLabel.text = passedValue._nombre_subasta
        objetoSubastaLabel.text = passedValue._objeto_subasta
        descripcionText.text = passedValue._descripcion_subasta
        precioSalidaLabel.text = passedValue._precio_minimo_subasta + "€"
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
