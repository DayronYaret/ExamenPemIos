//
//  User.swift
//  ExamenPem
//
//  Created by alumno on 02/01/2020.
//  Copyright © 2020 Dayron. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
struct User {
    
    let ref: DatabaseReference?
    let nombre:String
    let apellidos:String
    let dni:String
    let edad:Int
    let profesion:String
    let cv:String
    let key:String
    
    init(nombre:String, apellidos:String, dni:String, edad:Int, profesion:String, cv:String, key:String = "") {
        self.ref = nil
        self.key = key
        self.nombre = nombre
        self.apellidos = apellidos
        self.dni = dni
        self.edad = edad
        self.profesion = profesion
        self.cv = cv
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let nombre = value["nombre"] as? String,
            let apellidos = value["apellidos"] as? String,
            let dni = value["dni"] as? String,
            let edad = value["edad"] as? Int,
            let profesion = value["profesion"] as? String,
            let cv = value["cv"] as? String
            else {return nil}
        self.key = snapshot.key
        self.ref = snapshot.ref
        self.nombre = nombre
        self.apellidos = apellidos
        self.dni = dni
        self.edad = edad
        self.profesion = profesion
        self.cv = cv
    }
    
    func toAnyObject() -> Any {
        return [
            "nombre" : nombre,
            "apellidos" : apellidos,
            "dni" : dni,
            "edad" : edad,
            "profesion" : profesion,
            "cv" : cv
        ]
    }
}
