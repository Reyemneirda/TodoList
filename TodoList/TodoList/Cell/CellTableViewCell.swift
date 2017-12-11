//
//  CellTableViewCell.swift
//  TodoList
//
//  Created by Adrien Meyer on 09/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var checkButton: UIButton!
    @IBOutlet private weak var lbTitle: UILabel!
    @IBOutlet weak var lbNotes: UILabel!
    
      var todo:ToDo?
    
    func updateWithToDo(toDo: ToDo)
    {
        self.checkButton.isSelected = (self.todo?.isComplete)!
        self.lbTitle.text = toDo.title
        self.lbNotes.text = toDo.notes

    }
    
    @IBAction func toggleCompleted(_ sender: Any)
    {
        self.todo?.isComplete = !(self.todo?.isComplete)!
        
        self.checkButton.isSelected = (self.todo?.isComplete)!
    }
    
}
