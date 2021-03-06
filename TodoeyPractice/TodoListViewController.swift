//
//  ViewController.swift
//  TodoeyPractice
//
//  Created by Himanshu.Yadav1 on 16/08/18.
//  Copyright © 2018 Himanshu.Yadav1. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray=["apple","banana","orange"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{      //retrieving items 
            itemArray=items
        }
        
    }
 //****************************************************************************
    //MARK - Table View Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    
    //MARK - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField=UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("success")
            print(textField.text!)
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray,forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder="Create new item"
           textField=alertTextField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
}


