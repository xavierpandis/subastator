//
//  Subasta.swift
//  Subastator
//
//  Created by Javier Bono Parra on 25/5/17.
//  Copyright © 2017 pandisbono. All rights reserved.
//

class Subasta {
    
    var id: String = ""
    
    var _id: String {
        
        get{
            return id
        }
        
        set{
            id = newValue
        }
    }
    
    var creador: String = ""
    
    var _creador: String {
    
        get{
            return creador
        }
        
        set{
            creador = newValue
        }
    }
    
    
    var descripcion_subasta: String = ""
    
    var _descripcion_subasta: String {
        
        get{
            return descripcion_subasta
        }
        
        set{
            descripcion_subasta = newValue
        }
    }
    
    var nombre_subasta: String = ""
    
    var _nombre_subasta: String {
        
        get{
            return nombre_subasta
        }
        
        set{
            nombre_subasta = newValue
        }
    }
    
    var objeto_subasta: String = ""
    
    var _objeto_subasta: String {
        
        get{
            return objeto_subasta
        }
        
        set{
            objeto_subasta = newValue
        }
    }
    
    var precio_minimo_subasta: String = ""
    
    var _precio_minimo_subasta: String {
        
        get{
            return precio_minimo_subasta
        }
        
        set{
            precio_minimo_subasta = newValue
        }
    }
    
    init(id: String, creador: String, descripcion_subasta: String, nombre_subasta: String, objeto_subasta: String, precio_minimo_subasta: String){
        self.id = id
        self.creador = creador
        self.descripcion_subasta = descripcion_subasta
        self.nombre_subasta = nombre_subasta
        self.objeto_subasta = objeto_subasta
        self.precio_minimo_subasta = precio_minimo_subasta
    }
}
