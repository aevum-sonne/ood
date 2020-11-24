//
//  DocumentErrorMessage.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

enum DocumentErrorMessage: String {
  case unknownCommand = "Unknown command."
  case invalidArgumentsCount = "Invalid arguments count."
  case invalidPosition = "Invalid position."
  case invalidImageSize = "Invalid image size."
  case invalidUrlCreation = "Failed to create URL"
  case invalidItem = "Invalid document item"
  case failedImageCopyingToResources = "Failed image copying to resources folder."
  case failedImageResizing = "Failed image resizing."
  case failedImageSavingAfterResizing = "Failed to save image after resizing."
}
