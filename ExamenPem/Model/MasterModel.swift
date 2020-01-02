//
//  MasterModel.swift
//  ExamenPem
//
//  Created by alumno on 02/01/2020.
//  Copyright © 2020 Dayron. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MasterModel{
    var userArrayList: [User] = []
       
    func fillArray(completion: @escaping (Bool, [User]) -> Void){
           let ref = Database.database().reference().child("usuarios")
           ref.observe(.value, with: { (snapshot) in
               
               var userArrayListdummy : [User] = []
               print(snapshot.value)
               for child in snapshot.children{
                   if let snapshot = child as? DataSnapshot,
                       let person = User(snapshot: snapshot){
                       userArrayListdummy.append(person)
                       
                   }
               }
               print(userArrayListdummy)
               self.userArrayList = userArrayListdummy
               completion(false,self.userArrayList)
                Constants.Values.array = self.userArrayList
                       
           })
       
       }
}
