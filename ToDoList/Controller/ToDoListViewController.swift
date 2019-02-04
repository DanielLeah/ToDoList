//
//  ViewController.swift
//  ToDoList
//
//  Created by Daniel Leah on 01/02/2019.
//  Copyright © 2019 tae. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{

    var itemArray = [ToDoModel]()
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = ToDoModel()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        if let items = userDefaults.array(forKey: "ToDoListArray") as? [ToDoModel] {
            itemArray = items
        }
    }

    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //ternary operator ==>
        // value = condition ? valueIfTrue : ValueIfFalse
        
       cell.accessoryType =  item.isChecked ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked
       
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - ADD New Items
    
    @IBAction func AddTask(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new task", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = ToDoModel()
            newItem.title = textField.text!
            self.itemArray.append(newItem )
            
            self.userDefaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new Item"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


