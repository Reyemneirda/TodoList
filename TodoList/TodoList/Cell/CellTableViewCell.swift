//
//  CellTableViewCell.swift
//  TodoList
//
//  Created by Adrien Meyer on 09/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit


protocol ToDoTableViewCellDelegate : NSObjectProtocol
{
    func updateWithToDo(todo: ToDo?)
}


class CellTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var checkButton: UIButton!
    @IBOutlet private weak var lbTitle: UILabel!
    @IBOutlet weak var lbNotes: UILabel!
    
      var todo:ToDo?
    
    weak var delegate:ToDoTableViewCellDelegate?
    

    func updateWithToDo(toDo: ToDo)
    {
        self.todo = toDo
        self.checkButton.isSelected = (self.todo?.isComplete)!
        self.lbTitle.text = toDo.title
        self.lbNotes.text = toDo.notes

    }
    
    @IBAction func toggleCompleted(_ sender: Any)
    {
        self.todo?.isComplete = !(self.todo?.isComplete)!
        
        self.checkButton.isSelected = (self.todo?.isComplete)!
        
        self.delegate?.updateWithToDo(todo: self.todo)
    }
    
}
