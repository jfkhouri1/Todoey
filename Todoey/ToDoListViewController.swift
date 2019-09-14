//
//  ViewController.swift
//  Todoey
//
//  Created by jkhouri on 9/13/19.
//  Copyright © 2019 Joseph Khouri Consulting. All rights reserved.
//""

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["To do list 1", "To do list 2", "To do list 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func addTodoItemPressed(_ sender: Any) {
        // add to do item on nav bar is pressed.
        
        var newItemTextField = UITextField()
        
        // create an alert dialog box
        let alert = UIAlertController(title: "Add a New Todo Item", message: "", preferredStyle: .alert)
        
        // define an action to attach to this alert
        let addAction = UIAlertAction(title: "Add Item", style: .default) { (alertAction) in
            // what will happen once the user hits the action "Add Item" button on our alert
            
            // add new item to the list
            print("Placeholder: \(newItemTextField.placeholder)")
            print("Added Item: \(newItemTextField.text)")
            
            self.itemArray.append(newItemTextField.text ?? "")
            self.tableView.reloadData()
            
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default) { (alertAction) in
            print ("Cancel without doing anything")
        }
        
        
        // put an input text field on that Alert dialog box
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type the new item to add"
            
            newItemTextField = alertTextField
            
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        
        present (alert, animated: true)
    }
    
    
    //TODO: Declare cellForRowAtIndexPath here:"
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
    
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //TODO: Declare numberOfRowsInSection here:
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: Table view Delegate Methods:
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // user selected a table cell.    Check mark it if unchecked and vice versa.
        
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // deselect the current cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

