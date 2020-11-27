//
//  DocumentEditor.swift
//  DocumentEditor
//
//  Created by User on 26.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class DocumentEditor {
  init(stream: StandardStream) {
    self.stream = stream
    
    self.menu = Menu(stream: stream)
    
    menu.addItem(shortcut: "ip", description: "Insert Paragraph <position>|end <text>", command: insertParagraph)
    menu.addItem(shortcut: "ii", description: "Insert Image <position>|end <width> <height> path", command: insertImage)
    menu.addItem(shortcut: "set", description: "Set title <title>", command: setTitle)
    menu.addItem(shortcut: "list", description: "List of all available commands", command: list)
    menu.addItem(shortcut: "replace", description: "Replace text <position> <text>", command: replaceText)
    menu.addItem(shortcut: "resize", description: "Resize image <position> <width> <height>", command: resizeImage)
    menu.addItem(shortcut: "delete", description: "Delete item <position>", command: delete)
    menu.addItem(shortcut: "help", description: "Show help", command: help)
    menu.addItem(shortcut: "redo", description: "Redo command", command: redo)
    menu.addItem(shortcut: "undo", description: "Undo command", command: undo)
    menu.addItem(shortcut: "save", description: "Save to HTML <path>", command: save)
  }
  
  func start() {
    menu.run()
  }
  
  private func insertParagraph(args: [String]) throws {
    if DocumentCommand.insertParagraph.length > args.count {
      let error = DocumentError.invalidParagraphInsertion(.invalidArgumentsCount)
      print(error.localizedDescription, to: &stream.out)
      
      return
    }
    
    do {
      let position = try parsePosition(position: args[1])
      let text = args.dropFirst(2).joined(separator: " ")
      
      try document.insertParagraph(position: position, text: text)
    } catch {
      print(error.localizedDescription, to: &stream.out)
    }
  }
  
  private func insertImage(args: [String]) throws {
    if DocumentCommand.insertImage.length > args.count {
      let error = DocumentError.invalidImageInsertion(.invalidArgumentsCount)
      print(error.localizedDescription, to: &stream.out)

      return
    }
    
    do {
      let position = try parsePosition(position: args[1])
            
      guard let width = Int(args[2]), let height = Int(args[3]), width > 0 && height > 0 else {
        let error = DocumentError.invalidImageInsertion(.invalidImageSize)
        print(error.localizedDescription, to: &stream.out)
        
        return
      }
            
      try document.insertImage(position: position, path: args[4], width: UInt(width), height: UInt(height))
    } catch let error {
      print(error.localizedDescription, to: &stream.out)
    }
  }
  
  private func setTitle(args: [String]) throws {
    if DocumentCommand.setTitle.length > args.count {
      throw DocumentError.invalidTitleSetting(.invalidArgumentsCount)
    }
    
    let title = args.dropFirst(1).joined(separator: " ")
    
    document.setTitle(title: title)
  }
  
  private func list(args: [String]) {
    print("Title: \(document.title)", to: &stream.out)
    
    if document.count == 0 {
      return
    }
    
    for position in 0...document.count-1 {
      guard let item = document.getItem(index: position) else {
        let error = DocumentError.invalidCommand(.invalidPosition)
        print(error.localizedDescription, to: &stream.out)
        
        return
      }
      
      print("\(position+1). ", terminator: "", to: &stream.out)
      
      if (item.paragraph != nil) {
        print("Paragraph: \(item.paragraph!.value)", to: &stream.out)
      } else {
        let image = item.image!
        let filename = image.path.split(separator: "/").last!
        
        print("Image: path \"Resources/\(filename)\", resolution (\(image.width)x\(image.height)px)", to: &stream.out)
      }
    }
  }
  
  private func replaceText(args: [String]) {
    if DocumentCommand.replaceText.length > args.count {
      let error = DocumentError.invalidTextReplacement(.invalidArgumentsCount)
      print(error.localizedDescription, to: &stream.out)
      
      return
    }
    
    do {
      let position = try parsePosition(position: args[1])
      
      if position == nil {
        throw DocumentError.invalidTextReplacement(.invalidPosition)
      }
      
      let text = args.dropFirst(2).joined(separator: " ")
      
      // Position out of range
      if position! < 0 || position! > document.count {
        throw DocumentError.invalidTextReplacement(.invalidPosition)
      }
      
      guard let item = document.getItem(index: position! - 1) else {
        throw DocumentError.invalidTextReplacement(.invalidPosition)
      }
      
      if item.paragraph == nil {
        throw DocumentError.invalidTextReplacement(.invalidPosition)
      }
      
      item.paragraph!.setText(value: text)
    } catch let error {
      print(error.localizedDescription, to: &stream.out)
    }
  }
  
  private func resizeImage(args: [String]) {
    if DocumentCommand.resizeImage.length != args.count {
      let error = DocumentError.invalidImageResizing(.invalidArgumentsCount)
      print(error.localizedDescription, to: &stream.out)
      
      return
    }
    
    do {
      let position = try parsePosition(position: args[1])
      
      // Position is out of range
      if position! < 0 || position! > document.count {
        throw DocumentError.invalidTextReplacement(.invalidPosition)
      }
      
      guard let width = Int(args[2]), let height = Int(args[3]) else {
        let error = DocumentError.invalidImageResizing(.invalidImageSize)
        print(error.localizedDescription, to: &stream.out)
        
        return
      }
      
      // Width or height is out of range
      if (width > Constants.maxResolutionValue || height > Constants.maxResolutionValue || width < Constants.minResolutionValue || height < Constants.minResolutionValue) {
        throw DocumentError.invalidImageResizing(.invalidImageSize)
      }
      
      guard let item = document.getItem(index: position! - 1) else {
        throw DocumentError.invalidImageResizing(.invalidPosition)
      }
      
      if item.image == nil {
        throw DocumentError.invalidImageResizing(.invalidPosition)
      }
      
      try item.image!.resize(width: width, height: height)
    } catch let error {
      print(error.localizedDescription, to: &stream.out)
    }
  }
  
  private func delete(args: [String]) {
    if DocumentCommand.deleteItem.length != args.count {
      let error = DocumentError.invalidTextReplacement(.invalidArgumentsCount)
      print(error.localizedDescription, to: &stream.out)
      
      return
    }
    
    let position: Int
    
    if let convertedToIntPosition = Int(args[1]) {
      position = convertedToIntPosition
    } else {
      let error = DocumentError.invalidItemRemoving(.invalidPosition)
      print(error.localizedDescription, to: &stream.out)
      
      return
    }
    
    do {
      try document.deleteItem(position: position)
    } catch let error {
      print(error.localizedDescription, to: &stream.out)
    }
  }
  
  private func help(args: [String]) {
    menu.help()
  }
  
  private func redo(args: [String]) {
    do {
      try document.redo()
    } catch let error {
      print(error.localizedDescription, to: &stream.out)
    }
  }
  
  private func undo(args: [String]) {
    do {
      try document.undo()
    } catch let error {
      print(error.localizedDescription, to: &stream.out)
    }
  }
  
  private func save(args: [String]) throws {
    if (DocumentCommand.save.length > args.count) {
      throw DocumentError.invalidCommand(.invalidArgumentsCount)
    } else {
      document.save(path: args[1])
    }
  }
  
  private func parsePosition(position pos: String) throws -> Int? {
    if "end" == pos.lowercased() {
      return nil
    } else if Int(pos) != nil {
      return Int(pos)!
    } else {
      throw DocumentError.invalidParagraphInsertion(.invalidPosition)
    }
  }
  
  private let menu: Menu
  
  private let stream: StandardStream
  
  private let document: DocumentProtocol = Document()
}
