//
//  CellSubastasTaleViewCell.swift
//  Subastator
//
//  Created by Javier Bono Parra on 14/5/17.
//  Copyright © 2017 pandisbono. All rights reserved.
//

import UIKit

class CellSubastasTaleViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var estado: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
