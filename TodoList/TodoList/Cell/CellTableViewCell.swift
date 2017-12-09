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
    
    
    func updateWithToDo(toDo: ToDo)
    {
        //self.checkButton.imageView =
        self.lbTitle.text = toDo.title

    }
    
}
