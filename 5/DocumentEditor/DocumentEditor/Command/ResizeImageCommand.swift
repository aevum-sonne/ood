//
//  ResizeImageCommand.swift
//  DocumentEditor
//
//  Created by User on 01.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import Cocoa

class ResizeImageCommand: CommandProtocol {
  init(image: ImageProtocol, resoulution: ImageResolution, width: Int, height: Int) {
    self.image = image
    self.prevResolution = resoulution
    self.nextResolution = ImageResolution(width: width, height: height)
  }
  
  deinit {
    self.image = nil
  }
  
  func execute() {
    resize(width: nextResolution.width, height: nextResolution.height)
    swapResolutions()
  }
  
  func unexecute() {
    swapResolutions()
    resize(width: prevResolution.width, height: prevResolution.height)
  }
  
  private func swapResolutions() {
    let prevWidth = prevResolution.width
    let prevHeight = prevResolution.height
    
    prevResolution.width = nextResolution.width
    prevResolution.height = nextResolution.height
    
    nextResolution.width = prevWidth
    nextResolution.height = prevHeight
  }
  
  private func resize(width: Int, height: Int) {
    let size = NSSize(width: CGFloat(width), height: CGFloat(height))
    
    let url = URL(fileURLWithPath: image!.path)
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
  
  private var image: ImageProtocol?
  
  private var prevResolution: ImageResolution
  private var nextResolution: ImageResolution
}
