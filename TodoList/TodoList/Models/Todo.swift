//
//  Todo.swift
//  TodoList
//
//  Created by Adrien Meyer on 09/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import Foundation

class ToDo: NSObject, NSCoding
{
    
    
    var title:String
    var notes:String?
    var dueDate:Date
    var isComplete:Bool
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todo")
    
    init(title:String, notes:String? ,dueDate:Date,isComplete:Bool)
    {
        self.title = title
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
    
    init(dictionary: Dictionary<String,Any>)
    {
        self.title = dictionary["title"] as! String
        self.notes = (dictionary["notes"] as! String)
        self.dueDate = dictionary["dueDate"] as! Date
        self.isComplete = dictionary["isComplete"] as! Bool
    }
    
    func serialize() -> Dictionary<String,Any>
    {
        var dict : Dictionary<String,Any> = Dictionary()
        
        dict["title"] = self.title
        if let notes = self.notes
        {
            dict["notes"] = notes
        }
        
        dict["dueDate"] = self.dueDate
        dict["isComplete"] = self.isComplete
        
        return dict
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(title, forKey: "title")
        if( notes != nil )
        {
            aCoder.encode(notes, forKey: "notes")
        }
        
        aCoder.encode(dueDate, forKey: "dueDate")
        aCoder.encode(isComplete, forKey: "isComplete")
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        guard let title = aDecoder.decodeObject(forKey: "title") as? String,
            //            let notes = aDecoder.decodeObject(forKey: "notes") as? String,
            let dueDate = aDecoder.decodeObject(forKey: "dueDate") as? Date,
            let isComplete = aDecoder.decodeObject(forKey: "isComplete") as? Bool
            else {
                return nil
        }
        
        let notes : String? = aDecoder.decodeObject(forKey: "notes") as? String
        
        self.init(title:title, notes:notes, dueDate: dueDate, isComplete: isComplete)
    }
    
    static func saveToFile(todos:[ToDo])
    {
        //        NSKeyedArchiver.archiveRootObject(todos, toFile: ToDo.ArchiveURL.path)
        
        var emojiDicts : [Dictionary<String,Any>] = []
        
        for emoji : ToDo in todos
        {
            emojiDicts.append(emoji.serialize())
        }
        
        UserDefaults.standard.set(emojiDicts, forKey: "ToDo")
    }
    
    static func loadToDos() -> [ToDo]? // Make sure that the functions are static!!!
    {
        // not using nscoding for now
        
        var sampleEmojis : [ToDo] = []
        
        if let emojiDicts : [Dictionary<String,Any>] = UserDefaults.standard.object(forKey: "ToDo") as? [Dictionary<String, Any>]
        {
            for dict in emojiDicts
            {
                let emoji : ToDo = ToDo(dictionary: dict)
                sampleEmojis.append(emoji)
            }
        }
        else
        {
            return nil
        }
        
        return sampleEmojis
        
    }
    
    static func loadSampleToDos() -> [ToDo]
    {
        var returnArray:[ToDo] = []
        let todo1:ToDo = ToDo(title: "Wake up", notes: "press snooze", dueDate: Date(), isComplete: false)
        returnArray.append(todo1)
        
        let todo2:ToDo = ToDo(title: "Brush teeth", notes: "noe 2", dueDate: Date(), isComplete: false)
        returnArray.append(todo2)
        
        let todo3:ToDo = ToDo(title: "Make breakfast", notes: "Eggs with hot sauce.. mmm....", dueDate: Date(), isComplete: false)
        returnArray.append(todo3)
        
        return returnArray
    }
}
