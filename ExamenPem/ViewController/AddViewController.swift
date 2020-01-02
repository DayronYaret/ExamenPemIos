//
//  AddViewController.swift
//  ExamenPem
//
//  Created by alumno on 02/01/2020.
//  Copyright © 2020 Dayron. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    let addModel = AddModel()
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var cvField: UITextView!
    @IBOutlet weak var jobField: UITextField!
    @IBOutlet weak var dniField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var name:String = ""
    var surname:String = ""
    var dni:String = ""
    var age:String = ""
    var job:String = ""
    var cv:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func addUser(_ sender: Any) {
        name = nameField.text!
        surname = surnameField.text!
        dni = dniField.text!
        age = ageField.text!
        job = jobField.text!
        cv = cvField.text!
        addModel.validateFields(name: name, surname: surname, dni: dni, age: age, job: job, cv: cv) { (error, String) in
            if(!error){
                self.addModel.addUser(name: self.name, surname: self.surname, dni: self.dni, age: self.age, job: self.job, cv: self.cv) { (error) in
                    if(!error){
                        self.navigationController?.popViewController(animated: true)    }else{
                        self.errorLabel.text = "An error has ocurred"
                        self.errorLabel.alpha = 1
                    }
                }
            }else{
                self.errorLabel.text = String
                self.errorLabel.alpha = 1
            }
        }
    }
}
