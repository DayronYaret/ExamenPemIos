//
//  AddModel.swift
//  ExamenPem
//
//  Created by alumno on 02/01/2020.
//  Copyright © 2020 Dayron. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddModel{

    func addUser(name:String,surname:String,dni:String,age:String,job:String,cv:String, completion: @escaping (Bool) -> Void){
        let userAge = Int(age)
            let ref = Database.database().reference()
            ref.observeSingleEvent(of: .value) { (snapshot) in
                if(snapshot.childSnapshot(forPath: "usuarios").hasChild(dni)){
                    completion(true)
                }else{
                    
                    let dictionary = ["nombre": name, "apellidos": surname, "dni": dni, "edad": userAge as Any, "profesion": job, "cv": cv]
                    ref.child("usuarios").child(dni).setValue(dictionary)
    
                    completion(false)
                }
            }
        }
        func validateFields(name: String,surname:String,dni:String,age:String,job:String,cv:String, completion: @escaping (Bool,String) -> Void ) {
            //comprobamos si los campos estan llenos
            if(name.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
                surname.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
                dni.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
                age.trimmingCharacters(in: .whitespacesAndNewlines)=="" || job.trimmingCharacters(in: .whitespacesAndNewlines)=="" || cv.trimmingCharacters(in: .whitespacesAndNewlines)==""){
                
                completion(true,"Por favor, rellene todos los campos")
            }else{
                completion(false,"")
                
            }
    }
            
}
