//
//  DetailModel.swift
//  ExamenPem
//
//  Created by alumno on 02/01/2020.
//  Copyright © 2020 Dayron. All rights reserved.
//

import UIKit
import FirebaseDatabase
class DetailModel{
    
    var usuario:User?
    
    public func deleteUser(usuario:User, completion:@escaping(Bool)->Void){
        
        var ref = Database.database().reference().child("usuarios").child(usuario.dni)
        ref.removeValue()
        completion(false)
        
    }
}
