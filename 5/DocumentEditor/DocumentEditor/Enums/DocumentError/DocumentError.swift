//
//  DocumentError.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

enum DocumentError: Error {
  case invalidCommand(DocumentErrorMessage)
  case invalidParagraphInsertion(DocumentErrorMessage)
  case invalidImageInsertion(DocumentErrorMessage)
  case invalidTitleSetting(DocumentErrorMessage)
  case invalidTextReplacement(DocumentErrorMessage)
  case invalidImageResizing(DocumentErrorMessage)
  case invalidItemRemoving(DocumentErrorMessage)
  case invalidSaving(DocumentErrorMessage)
}

extension DocumentError: LocalizedError {
  public var errorDescription: String? {
    switch self {
      case .invalidCommand(let message):
        return "Invalid command. \(message.rawValue)"
      case .invalidParagraphInsertion(let message):
        return "Failed paragraph insertion. \(message.rawValue)"
      case .invalidImageInsertion(let message):
        return "Failed image insertion. \(message.rawValue)"
      case .invalidTitleSetting(let message):
        return "Invalid title setting. \(message.rawValue)"
      case .invalidTextReplacement(let message):
        return "Invalid text replacement. \(message.rawValue)"
      case .invalidImageResizing(let message):
        return "Invalid image resizing. \(message.rawValue)"
      case .invalidItemRemoving(let message):
        return "Invalid item removing. \(message.rawValue)"
      case .invalidSaving(let message):
        return "Invalid file saving. \(message.rawValue)"
    }
  }
}
