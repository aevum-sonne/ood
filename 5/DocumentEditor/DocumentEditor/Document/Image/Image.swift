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
  
  private let history: History
  private let url: URL
  private let resolution: ImageResolution
  
  init(path: String, width: Int, height: Int, history: History) throws {
    guard let sourceUrl = URL(string: Constants.filePrefix + path) else {
      throw DocumentError.invalidImageInsertion(.invalidUrlCreation)
    }
    
    if (Constants.imageExtensions.firstIndex(of: sourceUrl.pathExtension) == nil) {
      print("Source file isn't image")
      
      throw DocumentError.invalidImageInsertion(.invalidUrlCreation)
    }
    
    let resourcesUrl = URL(string: Constants.filePrefix + Constants.resourcesPath + Constants.imagesFolder)!
    
    if let successUrl = FileManager.default.secureCopyItem(at: sourceUrl, to: resourcesUrl) {
      self.url = successUrl
      print("Image successfully copied to \(url.path).")
    } else {
      throw DocumentError.invalidImageInsertion(.failedImageCopyingToResources)
    }
    
    self.history = history
    self.resolution = ImageResolution(width: width, height: height)
    
    if !resolutionIsValid(width: width, height: height) {
      throw DocumentError.invalidImageInsertion(.invalidImageSize)
    }
    
    resize(width: width, height: height)
  }
  
  private func resolutionIsValid(width: Int, height: Int) -> Bool {
    return (width <= Constants.maxResolutionValue && height <= Constants.maxResolutionValue && width > Constants.minResolutionValue && height > Constants.minResolutionValue)
  }
  
  deinit {
    do {
      try FileManager.default.removeItem(at: url)
      let files = try FileManager.default.contentsOfDirectory(atPath: url.path)
      print("All files in cache after deleting images: \(files)")
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  func resize(width: Int, height: Int) {
    if !resolutionIsValid(width: width, height: height) {
      print(DocumentError.invalidImageInsertion(.invalidImageSize).localizedDescription)
      
      return
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
  
  static func resizeAtUrl(url: URL, width: Int, height: Int) {
    let size = NSSize(width: CGFloat(width), height: CGFloat(height))
    
    var image = NSImage(byReferencing: url)

    let resizedImage = image.resize(withSize: size)
    
    if resizedImage != nil {
      image = resizedImage!
    }
    
    do {
      try image.saveImage(url: url)
    } catch let error {
      print("Cannot resize image at \(url). Error: \(error.localizedDescription)")
    }
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