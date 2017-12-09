//
//  Todo.swift
//  TodoList
//
//  Created by Adrien Meyer on 09/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import Foundation

class ToDo {
    
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?) {
        self.title = title
        self.isComplete =  isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
 
    static func loadToDos() -> [ToDo]?  {
        let toDo1 = ToDo(title: "Do The Exercise", isComplete: false, dueDate: Date(), notes: "quick,quick,quick")
        
        return [toDo1]
    }
    
    
}


