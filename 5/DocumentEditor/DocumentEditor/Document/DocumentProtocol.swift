//
//  DocumentProtocol.swift
//  DocumentEditor
//
//  Created by User on 26.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol DocumentProtocol {
  var count: Int { get }
  var title: String { get }
  
  func setTitle(title: String)
  
  func insertParagraph(position: Int?, text: String) throws
  func insertImage(position: Int?, path: String, width: UInt, height: UInt) throws
        
  func getItem(index: Int) -> DocumentItemProtocol?
  
  func deleteItem(position: Int) throws
  
  func canUndo() -> Bool
  func undo()
  
  func canRedo() -> Bool
  func redo()
  
  func save(path: String)
}
