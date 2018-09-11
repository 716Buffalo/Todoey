//
//  CategoryViewController.swift
//  Todoey
//
//  Created by David Guarino on 9/9/18.
//  Copyright © 2018 David Guarino. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadCategories()
        
    }
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        
        
        // Ternary Operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        //   cell.accessoryType = categories.name  ? .detailDisclosureButton : .none
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
           performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
       //  categories[indexPath.row].name = !categories[indexPath.row].name
        
        // NOTE:  To mark a "" after each row -
      //   itemArray[indexPath.row].setValue("Completed", forKey: "title")
         
         //  NOTE: To delete an item -
         
        //context.delete(categories[indexPath.row])
         // categories.remove(at: indexPath.row)
        
        
        
       // tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        // MARK - Data Manipulation Methods
        func saveCategories() {
            
            do {
                try context.save()
            }
            catch {
                print("Error saving context")
                
            }
            
            
            self.tableView.reloadData()
            
        }
        
        
        func loadCategories() {
            
            let request : NSFetchRequest<Category> = Category.fetchRequest()
            
            do {
                categories = try context.fetch(request)
            }
            catch {
                print("Error fetching data from context \(error)")
            }
            tableView.reloadData()
        }
        // MARK - Add New Categories
        
        
        
        
        
        
        
    
  // MARK - Tableview Data Methods
    
    
    
    
      @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Processing Job", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Job", style: .default) { (action) in
            
            // What will happen once the user clicks the ADD item Button on our UIAlert
            
            
            
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            
            self.categories.append(newCategory)
            
            
            
            self.saveCategories()
        }
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField.placeholder = "Create New Job"
            
            textField = field
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    // MARK - Tableview Delegate Methods
    
    
    
    
    
    // MARK - Manipulation Methods
}
