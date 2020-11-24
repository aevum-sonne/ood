//
//  DocumentCommand.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

enum DocumentCommand: UInt {
  case insertParagraph
  case insertImage
  case replaceText
  case resizeImage
  case setTitle
  case deleteItem
  case save
  
  var length: UInt {
    switch self {
      case .insertParagraph:
        return 3
      case .insertImage:
        return 5
      case .replaceText:
        return 3
      case .resizeImage:
        return 4
      case .setTitle:
        return 2
      case .deleteItem:
        return 2
      case .save:
        return 2
    }
  }
}
