//
//  DesignersTasksManager.swift
//  DesignersFactory
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

func getDesignersTasks(filename: String) -> [String] {
  let path = Bundle.main.path(forResource: filename, ofType: "txt")
  let contents = try! String(contentsOfFile: path!)
  let tasks = contents.split(separator:"\n").map { String($0) }
  
  return tasks
}
