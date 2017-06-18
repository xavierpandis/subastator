//
//  Puja.swift
//  Subastator
//
//  Created by Javier Bono Parra on 25/5/17.
//  Copyright © 2017 pandisbono. All rights reserved.
//

class Puja {
    
    var dinero: String = ""
    
    var _dinero: String {
        
        get{
            return dinero
        }
        
        set{
            dinero = newValue
        }
    }
    
    var pujador: String = ""
    
    var _pujador: String {
        
        get{
            return pujador
        }
        
        set{
            pujador = newValue
        }
    }
    
    
    init(dinero: String, pujador: String){
        self.dinero = dinero
        self.pujador = pujador
    }
}
