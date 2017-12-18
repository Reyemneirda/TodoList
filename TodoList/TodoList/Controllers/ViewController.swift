//
//  ViewController.swift
//  TodoList
//
//  Created by Adrien Meyer on 09/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit

class ViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!

    
    var toDo:[ToDo]?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
         self.tableView.register(UINib(nibName: "CellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        
        if let loadedTodoList : [ToDo] = ToDo.loadToDos(), loadedTodoList.count > 0
        {
            self.toDo = loadedTodoList
        }
        else
        {
            self.toDo = ToDo.loadSampleToDos()
            ToDo.saveToFile(todos: self.toDo!)
        }
        
        self.tableView.reloadData()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath: IndexPath =
            self.tableView.indexPathForSelectedRow
        {
            self.tableView.deselectRow(at: indexPath, animated: false)
        }
    }

    
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDo!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : CellTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellTableViewCell)!

        let todo : ToDo = self.toDo![indexPath.row]

        cell.delegate = self as! ToDoTableViewCellDelegate

        cell.updateWithToDo(toDo: todo)
 
      
        
        return cell

}
    
    @IBAction func addToDo(_ sender: Any)
    {
        performSegue(withIdentifier: "addToDo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc : AddToDoViewController = segue.destination as? AddToDoViewController
        {
            vc.delegate = self as! AddToDoDelegate
        }
    }
    
    func addToDo(todo: ToDo)
    {
        self.toDo?.append(todo)
        
        ToDo.saveToFile(todos: self.toDo! )
        
        self.tableView.reloadData()
    }
}
