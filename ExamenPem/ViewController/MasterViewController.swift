//
//  MasterViewController.swift
//  ExamenPem
//
//  Created by alumno on 02/01/2020.
//  Copyright © 2020 Dayron. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let masterModel = MasterModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    @IBOutlet weak var tableViewU: UITableView!
    var userArray:[User] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = userArray[indexPath.row].nombre
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewU.delegate = self
        tableViewU.dataSource = self
        masterModel.fillArray { (error, array) in
            if(error == false){
                self.userArray = array;
                self.tableViewU.reloadData()
            }
        }// Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detalle"){
            if let indexPath = tableViewU.indexPathForSelectedRow{
                let detailController = segue.destination as! DetailViewController
                detailController.usuario = self.userArray[indexPath.row]
                
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
