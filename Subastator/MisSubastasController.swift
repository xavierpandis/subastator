//
//  MisSubastasController.swift
//  Subastator
//
//  Created by xavipandis on 04/04/2017.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MisSubastasController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var misSubastas: FIRDatabaseReference!
    let arraySubastas: NSMutableArray = []
    
    @IBOutlet var tablaMisSubastas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "backgroundpicture.png")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        tablaMisSubastas.dataSource = self
        tablaMisSubastas.delegate = self
        
        let credentials = UserDefaults.standard
        let userlogged = credentials.string(forKey: userCredentials.usr)
        
        misSubastas = ref.child("subastas")

        misSubastas.observe(FIRDataEventType.value, with: { (snapshot) in
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? FIRDataSnapshot {
                let value = rest.value as? NSDictionary
                if(value?["creador"] as? String == userlogged){
                    self.arraySubastas.add(value! as NSDictionary)
                }
                
            }
            self.tablaMisSubastas.reloadData()
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arraySubastas.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMisSubastas", for: indexPath) as! CellMisSubastasTableViewCell
        
        let value = arraySubastas[indexPath.row] as? NSDictionary
        
        cell.nombre.text = value?["nombre_subasta"] as! String?
        cell.precio.text = value?["precio_minimo_subasta"] as! String?
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
    }

}
