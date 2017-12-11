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
        
        if let savedToDos: [ToDo] = ToDo.loadToDos()
        {
            self.toDo = savedToDos
        }
        else
        {
            self.toDo = ToDo.loadToDos()
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
        return toDo!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell : CellTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellTableViewCell)!
        // reuses or initializes a new cell
        
        
        //        cell.textLabel?.text = "Row \(indexPath.row)"
        
        let todo : ToDo = self.toDo![indexPath.row]
        // gets the corresponding emoji for the indexpath row
        
        cell.updateWithToDo(toDo: todo)
        // has the cell update its label based on the emoji
        
        //        cell.textLabel?.text = String(emoji.symbol)
        //        cell.detailTextLabel?.text = emoji.emojidescription
        
        return cell
//
//
//        guard let cell: CellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellTableViewCell else
//        {
//
//            fatalError("Could not dequeue a cell")
//        }
//
//        let todo = toDo![indexPath.row]
//        cell.textLabel?.text = todo.title
//        return cell
//
//    }
    

 
}

}
