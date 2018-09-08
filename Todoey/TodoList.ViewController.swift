//
//  ViewController.swift
//  Todoey
//
//  Created by David Guarino on 9/7/18.
//  Copyright © 2018 David Guarino. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Bulk Pack/Sweeper","Marbits","Chex Rolls"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
            
            cell.textLabel?.text = itemArray[indexPath.row]
            
            return cell
        }

    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
       
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .detailDisclosureButton {
             tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .detailDisclosureButton
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
   // MARK - ADD NEW ITEMS
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Processing Job", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Job", style: .default) { (action) in
           
        // What will happen once the user clicks the ADD item Button on our UIAlert
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()

           
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Job"
            print(alertTextField.text)
            textField = alertTextField
            
            
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}










