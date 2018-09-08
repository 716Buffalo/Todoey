//
//  ViewController.swift
//  Todoey
//
//  Created by David Guarino on 9/7/18.
//  Copyright © 2018 David Guarino. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        let newItem = Item()
        newItem.title = "Bulk Pack/Sweeper"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Marbits"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Chex Rolls"
        itemArray.append(newItem3)
        
        
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
    }
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item =  itemArray[indexPath.row]
            
        cell.textLabel?.text = item.title
        
        // Ternary Operator ==>
        // value = condition ? valueIfTrue : valueIfFalse

        cell.accessoryType = item.done  ? .detailDisclosureButton : .none
    
        
        
            return cell
        }

    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
    
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
       
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
   // MARK - ADD NEW ITEMS
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Processing Job", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Job", style: .default) { (action) in
           
        // What will happen once the user clicks the ADD item Button on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
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










