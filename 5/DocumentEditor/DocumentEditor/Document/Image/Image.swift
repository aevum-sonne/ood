//
//  Image.swift
//  DocumentEditor
//
//  Created by User on 30.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import Cocoa

class Image: ImageProtocol {
  var path: String {
    return url.path
  }
  
  var width: Int {
    return resolution.width
  }
  
  var height: Int {
    return resolution.height
  }
  
  init(path: String, width: Int, height: Int, history: History) throws {
    guard let sourceUrl = URL(string: Constants.filePrefix + path) else {
      throw DocumentError.invalidImageInsertion(.invalidUrlCreation)
    }
    
    if (Constants.imageExtensions.firstIndex(of: sourceUrl.pathExtension) == nil) {
      throw DocumentError.invalidImageInsertion(.invalidUrlCreation)
    }
    
    let resourcesUrl = URL(string: Constants.filePrefix + Constants.resourcesPath + Constants.imagesFolder)!
    
    if let successUrl = FileManager.default.secureCopyItem(at: sourceUrl, to: resourcesUrl) {
      self.url = successUrl
    } else {
      throw DocumentError.invalidImageInsertion(.failedImageCopyingToResources)
    }
    
    self.history = history
    self.resolution = ImageResolution(width: width, height: height)
    
    if !resolutionIsValid(width: width, height: height) {
      throw DocumentError.invalidImageInsertion(.invalidImageSize)
    }
    
    try resize(width: width, height: height)
  }
  
  private let history: History
  private let url: URL
  private let resolution: ImageResolution
  
  private func resolutionIsValid(width: Int, height: Int) -> Bool {
    return (width < Constants.maxResolutionValue
      && width > Constants.minResolutionValue
      && height < Constants.maxResolutionValue
      && height > Constants.minResolutionValue)
  }
  
  deinit {
    try? FileManager.default.removeItem(at: url)
  }
  
  func resize(width: Int, height: Int) throws {
    if !resolutionIsValid(width: width, height: height) {
      throw DocumentError.invalidImageInsertion(.invalidImageSize)
    }
    
    history.saveAndExecuteCommand(command: ResizeImageCommand(image: self, resoulution: resolution, width: width, height: height))
  }
}

extension NSImage {
  var height: CGFloat {
    return self.size.height
  }
  
  var width: CGFloat {
    return self.size.width
  }

  func resize(withSize targetSize: NSSize) -> NSImage? {
    let frame = NSRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
    guard let representation = self.bestRepresentation(for: frame, context: nil, hints: nil) else {
      return nil
    }
    let image = NSImage(size: targetSize, flipped: false, drawingHandler: { (_) -> Bool in
      return representation.draw(in: frame)
    })
    
    return image
  }
  
  func imageRepresentation(imageExtension: String) -> Data? {
    let imageType: NSBitmapImageRep.FileType
    
    switch imageExtension {
      case "jpg":
        imageType = .jpeg
      case "jpeg":
        imageType = .jpeg2000
      case "png":
        imageType = .png
      case "gif":
        imageType = .gif
      default:
        imageType = .png
    }
    
    if let tiff = self.tiffRepresentation, let tiffData = NSBitmapImageRep(data: tiff) {
      return tiffData.representation(using: imageType, properties: [:])
    }
    
    return nil
  }
  
  func saveImage(url: URL) throws {
    if let image = imageRepresentation(imageExtension: url.pathExtension) {
      try image.write(to: url, options: .atomicWrite)
    }
  }
}
