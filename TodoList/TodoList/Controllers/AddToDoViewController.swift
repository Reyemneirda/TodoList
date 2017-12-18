//
//  AddToDoViewController.swift
//  TodoList
//
//  Created by Adrien Meyer on 11/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit


protocol AddToDoDelegate : NSObjectProtocol
{
    func addToDo(todo: ToDo )
}

class AddToDoViewController: BaseViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var txtFieldTitle: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var txtViewNotes: UITextView!
    @IBOutlet weak var completedSwitch: UISwitch!
    
     weak var delegate:AddToDoDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.containerView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        self.containerView.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.size.width, height: self.containerView.frame.size.height) // only to scroll up and down
        
        self.scrollView.addSubview(self.containerView)
        
    }
    
    func Upd
    
    
    @IBAction func save(_ sender: Any)
    {
        guard let title = self.txtFieldTitle.text else
        {
            return
        }
        
        let todo:ToDo = ToDo(title: title, notes: self.txtViewNotes.text, dueDate: self.dueDatePicker.date, isComplete: self.completedSwitch.isOn)
        
        self.delegate?.addToDo(todo: todo)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancel(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }

}
