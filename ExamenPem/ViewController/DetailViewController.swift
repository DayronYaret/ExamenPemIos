//
//  DetailViewController.swift
//  ExamenPem
//
//  Created by alumno on 02/01/2020.
//  Copyright © 2020 Dayron. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var usuario:User?
    let detailModel = DetailModel ()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var cvLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let usuarioDetalle = usuario else{return}
        nameLabel.text = usuarioDetalle.nombre
        surnameLabel.text = usuarioDetalle.apellidos
        ageLabel.text = String(usuarioDetalle.edad)
        dniLabel.text = usuarioDetalle.dni
        jobLabel.text = usuarioDetalle.profesion
        cvLabel.text = usuarioDetalle.cv

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteUser(_ sender: Any) {
        detailModel.deleteUser(usuario: usuario!) { (error) in
            if(error == false){
                self.navigationController?.popViewController(animated: true)
            }else{
                print("no se borro el usuario")
            }
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
