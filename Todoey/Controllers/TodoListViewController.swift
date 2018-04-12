//
//  ViewController.swift
//  Todoey
//
//  Created by Madhuri kumari on 11/04/18.
//  Copyright © 2018 Madhuri kumari. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    //let defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(dataFilePath)
        
        
        /*let newItem = Item()
        newItem.title = "Find Milk"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Find Milk1"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Find Milk2"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Milk3"
        itemArray.append(newItem3)*/
        
        /*if let items = UserDefaults.standard.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }*/
        
        loadItems()
        
    }
    
    //MARK - Table datasource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        //cell.textLabel?.text = itemArray[indexPath.row].title
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        //cell.accessoryType = item.done == true ? .checkmark : .none
        /*--------------------------------or----------------------------*/
        /*if itemArray[indexPath.row].done == true {
         cell.accessoryType = .checkmark
         }else{
         cell.accessoryType = .none
         }*/
        /*------------------------------------------------------------*/
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        /*--------------------------------or----------------------------*/
        /*if itemArray[indexPath.row].done == false {
         itemArray[indexPath.row].done = true
         }else{
         itemArray[indexPath.row].done = false
         }*/
        /*------------------------------------------------------------*/
        /*if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
         tableView.cellForRow(at: indexPath)?.accessoryType = .none //to make uncheck when clicking
         }else{
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark //to make a check mark when clicking
         }*/
        
        saveItems()
        
        //tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() //initialised to empty
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.saveItems()
            
            
            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    // TO SAVE THE DATA
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        }catch {
            print("Error encoder item array, \(error)")
        }
        self.tableView.reloadData() // to reload the data in array
    }
    
    // TO RETRIVE THE DATA
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            }catch{
                print("Error decoding item array, \(error)")
            }
        }
    }
    
}
