//
//  ViewController.swift
//  Todoey
//
//  Created by jkhouri on 9/13/19.
//  Copyright © 2019 Joseph Khouri Consulting. All rights reserved.
//""

import UIKit

class ToDoListViewController: UITableViewController {

    
    var itemArray = [TodoItem]()
    let myUserDefaultsKey = "ToDoListArray"


    var myUserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // retrieve saved ToDoListArray in the user default and store it in itemArray
        
// Commenting out all use of myUserDefaults because it caused my code to crash and then learned that my data is too complex for user defaults and hence should not be used.
        
//        if let items = myUserDefaults.array(forKey: myUserDefaultsKey) as? [TodoItem] {
//            itemArray = items
//        }

        
    }

    @IBAction func addTodoItemPressed(_ sender: Any) {
        // add to do item on nav bar is pressed.
        
        var newItemTextField = UITextField()
        
        // create an alert dialog box
        let alert = UIAlertController(title: "Add a New Todo Item", message: "", preferredStyle: .alert)
        
        // define an action to attach to this alert
        let addAction = UIAlertAction(title: "Add Item", style: .default) { (alertAction) in
            // what will happen once the user hits the action "Add Item" button on our alert
            
            // append new item to itemArray and store it in userdefaults and update screen
            let item = TodoItem()
            item.itemDescription = newItemTextField.text ?? ""
            item.fCompleted = false
            
            self.itemArray.append(item)

//            self.myUserDefaults.set(self.itemArray, forKey: self.myUserDefaultsKey)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
    
        cell.textLabel?.text = itemArray[indexPath.row].itemDescription

        
        if itemArray[indexPath.row].fCompleted {
            // check mark item because it is completed
            cell.accessoryType = .checkmark
        } else {
            // else no checkmark for this item
            cell.accessoryType = .none
        }
        
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
            itemArray[indexPath.row].fCompleted = false
            
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            itemArray[indexPath.row].fCompleted = true
        }
        
        // deselect the current cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

