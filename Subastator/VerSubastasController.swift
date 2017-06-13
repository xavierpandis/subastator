//
//  VerSubastasController.swift
//  Subastator
//
//  Created by Javier Bono Parra on 14/5/17.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit
import FirebaseDatabase

class VerSubastasController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var subastas: FIRDatabaseReference!
    var arraySub: [Subasta] = []
    let arraySubastas: NSMutableArray = []
    
    
    @IBOutlet var tablaSubastas: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tablaSubastas.dataSource = self
        tablaSubastas.delegate = self
        
        subastas = ref.child("subastas")
        

        subastas.observe(FIRDataEventType.value, with: { (snapshot) in
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? FIRDataSnapshot {
                let value = rest.value as? NSDictionary
                    self.arraySubastas.add(value! as NSDictionary)
                
                    let sub = Subasta(id: rest.key, creador: value?["creador"] as! String, descripcion_subasta: value?["descripcion_subasta"] as! String, nombre_subasta: value?["nombre_subasta"] as! String, objeto_subasta: value?["objeto_subasta"] as! String, precio_minimo_subasta: value?["precio_minimo_subasta"] as! String)
                
                self.arraySub.append(sub)
            }
            self.tablaSubastas.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var valueToPass: Subasta!

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as! CellSubastasTaleViewCell
        
        valueToPass = arraySub[indexPath.row]
        
        /*performSegue(withIdentifier: "SubastaDetail", sender: self)*/
    }
    
    /*func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "SubastaDetail") {
            // initialize new view controller and cast it as your view controller
            let detail = segue.destination as! SubastaDetailController
            // your new view controller should have property that will store passed value
            detail.passedValue = valueToPass
        }
    }*/
    
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraySub.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSubastas", for: indexPath) as! CellSubastasTaleViewCell
        
        let value = arraySub[indexPath.row] as? Subasta
        
        cell.nombre.text = value?._nombre_subasta
        cell.precio.text = value?._precio_minimo_subasta
        //cell.estado.text = value?["estado"] as! String?
        
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    // Override to support rearranging the table view.
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    
    
    // Override to support conditional rearranging of the table view.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        let detalle = segue.destination as! SubastaDetailController
        
        let detalleIndex = tablaSubastas.indexPathForSelectedRow?.row
        
        let detalleSelected = arraySub[detalleIndex!]
        
        print("--- DETALLE SELECTED ---")
        print(detalleSelected._id)
        
        detalle.passedValue = detalleSelected
        
    }
    
}
