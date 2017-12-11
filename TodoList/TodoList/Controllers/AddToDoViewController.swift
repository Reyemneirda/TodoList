//
//  AddToDoViewController.swift
//  TodoList
//
//  Created by Adrien Meyer on 11/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit

class AddToDoViewController: BaseViewController {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.containerView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        self.containerView.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.size.width, height: self.containerView.frame.size.height) // only to scroll up and down
        
        self.scrollView.addSubview(self.containerView)
        
    }
    
    @IBAction func cancel(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }

}
