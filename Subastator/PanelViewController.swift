//
//  PanelViewController.swift
//  Subastator
//
//  Created by xavipandis on 04/04/2017.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit

class PanelViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let credentials = UserDefaults.standard
        let userlogged = credentials.string(forKey: userCredentials.usr)

        userName.text = userlogged
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
