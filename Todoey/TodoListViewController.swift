//
//  ViewController.swift
//  Todoey
//
//  Created by Madhuri kumari on 11/04/18.
//  Copyright © 2018 Madhuri kumari. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Milk", "Eggs", "Mangos", "Apple"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //MARK - Table datasource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none //to make uncheck when clicking 
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark //to make a check mark when clicking
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    


}

