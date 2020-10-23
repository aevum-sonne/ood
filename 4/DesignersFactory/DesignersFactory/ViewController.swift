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
    let canvas = Canvas(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000))
    let painter = Painter()

    painter.drawPicture(canvas: canvas, draft: draft)
    view.addSubview(canvas)
  }
  
  private func getDesignersTasks(filename: String) -> [String] {
    let path = Bundle.main.path(forResource: filename, ofType: "txt")
    let contents = try! String(contentsOfFile: path!)
    let tasks = contents.split(separator:"\n").map { String($0) }
    
    return tasks
  }
  
  
}
