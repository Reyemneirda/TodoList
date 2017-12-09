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

    
    var toDo : [ToDo]? {
        
        if let loadedTodo : [ToDo] = ToDo.loadToDos()
        {
            return loadedTodo
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
         self.tableView.register(UINib(nibName: "CellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
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
