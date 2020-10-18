//
//  ViewController.swift
//  DesignersFactory
//
//  Created by User on 15.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let factory = ShapeFactory()
    let designer = Designer(factory: factory)
    let tasks = getDesignersTasks(filename: "Tasks")
    let draft = designer.createDraft(tasks: tasks)
    let painter = Painter()
    
    painter.drawPicture(view: view, draft: draft)
  }
  
  
}
