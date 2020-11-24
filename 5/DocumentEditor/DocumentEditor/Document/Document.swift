//
//  Document.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Document: DocumentProtocol {
  public var count: Int {
    return items.value.count
  }
  
  public var title: String {
    return textTitle.value
  }
  
  private let textTitle: TextProtocol = Text(value: "")
  private let items: DocumentItemArrayProtocol = DocumentItemArray()
  private let history = History()
  
  func setTitle(title: String) {
    history.saveAndExecuteCommand(command: ReplaceTextCommand(text: self.textTitle, newText: Text(value: title)))
  }
  
  func insertParagraph(position: Int?, text: String) throws {
    let position = position == nil ? items.value.count : position! - 1
    
    if !isPositionValid(position: position) {
      throw DocumentError.invalidParagraphInsertion(.invalidPosition)
    }
    
    let paragraph = Paragraph(text: Text(value: text), history: history)
    let item = DocumentItem(paragraph: paragraph)
    
    history.saveAndExecuteCommand(command: InsertItemCommand(item: item, items: items, position: position))
  }
  
  func insertImage(position: Int?, path: String, width: UInt, height: UInt) throws {
    let position = position == nil ? items.value.count : position! - 1
    
    if !isPositionValid(position: position) {
      throw DocumentError.invalidImageInsertion(.invalidPosition)
    }
    
    do {
      let image = try Image(path: path, width: Int(width), height: Int(height), history: history)
      let item = DocumentItem(image: image)
      
      history.saveAndExecuteCommand(command: InsertItemCommand(item: item, items: items, position: position))
    } catch let error {
      throw error
    }
  }
  
  func getItem(index: Int) -> DocumentItemProtocol? {
    if !items.value.indices.contains(index) {
      return nil
    }
    
    return items.value[index]
  }

  func deleteItem(position: Int) throws {
    if !isPositionValid(position: position) {
      throw DocumentError.invalidItemRemoving(.invalidPosition)
    }
    
    history.saveAndExecuteCommand(command: DeleteItemCommand(items: items, position: position - 1))
  }
  
  func canUndo() -> Bool {
    return false
  }
  
  func undo() {
    do {
      try history.undo()
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func canRedo() -> Bool {
    return false
  }
  
  func redo() {
    do {
      try history.redo()
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func save(path: String) {
    let documentSaver = DocumentSaver(title: textTitle.value, items: items.value)
    
    documentSaver.save(pathToFile: path)
  }
  
  private func isPositionValid(position: Int) -> Bool {
    return position >= 0 && position <= items.value.count
  }
}
