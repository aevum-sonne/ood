//
//  DocumentSaver.swift
//  DocumentEditor
//
//  Created by User on 29.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import Cocoa

class DocumentSaver {
  init(title: String, items: [DocumentItemProtocol]) {
    self.title = title
    self.items = items
  }
  
  private let items: [DocumentItemProtocol]
  private let title: String
  
  func save(pathToFile: String) {
    FileManager.default.createFile(atPath: pathToFile, contents: nil, attributes: nil)
    
    let url = URL(string: Constants.filePrefix + pathToFile)
    
    if let outStream = OutputStream(url: url!, append: true) {
      let encodedHtmlContent = [UInt8](formHtmlDocumentContent().utf8)
      
      outStream.open()
      outStream.write(encodedHtmlContent, maxLength: encodedHtmlContent.count)
    }
  }
  
  private func createDocument(url: URL) throws {
    try String.init().write(to: url, atomically: true, encoding: .utf8)
  }
  
  private func formHtmlDocumentContent() -> String {
    var htmlContent = formTag(name: "!DOCTYPE html", indentCount: 0)
    
    htmlContent += formTag(name: "html", indentCount: 0)
    htmlContent += formTag(name: "head", indentCount: 1)
    htmlContent += formFullTag(name: "title", content: title, indentCount: 2)
    htmlContent += formTag(name: "head", indentCount: 1)
    htmlContent += formTag(name: "body", indentCount: 1)
    htmlContent += formBodyContent()
    htmlContent += formTag(name: "body", indentCount: 1)
    htmlContent += formTag(name: "html", indentCount: 0)
    
    return htmlContent
  }
  
  private func formTag(name: String, indentCount: Int, insertNewline: Bool = true) -> String {
    let separator = "    "
    let tag = "\(String(repeating: separator, count: indentCount))<\(name)>" + (insertNewline ? "\n" : "")
    
    return tag
  }
  
  private func formFullTag(name: String, content: String, indentCount: Int) -> String {
    let fullTag = formTag(name: name, indentCount: indentCount, insertNewline: false) + " \(content) " + formTag(name: "/" + name, indentCount: 0)
    
    return fullTag
  }
  
  private func formImageTag(path: String, indentCount: Int) -> String {
    let separator = "    "
    let imageTag = "\(String(repeating: separator, count: indentCount))<img src=\"\(path)\" />\n"
    
    return imageTag
  }
  
  private func formBodyContent() -> String {
    var content = ""
    
    for item in items {
      if let paragraph = item.paragraph {
        let text = encodeParagraphText(text: paragraph.value)
        
        content += formFullTag(name: "p", content: text, indentCount: 2)
      } else {
        content += formImageTag(path: item.image!.path, indentCount: 2)
      }
    }
    
    return content
  }
  
  private let htmlEntities = [("&", "&amp;"), ("<", "&lt;"), (">", "&gt;"), ("'", "&apos;"), ("\"", "&quot;")]
  
  private func encodeParagraphText(text: String) -> String {
    var encoded = text
    
    for entity in htmlEntities {
      encoded = encoded.replacingOccurrences(of: entity.0, with: entity.1)
    }
    
    return encoded
  }
}

extension FileManager {
  open func secureCopyItem(at source: URL, to destination: URL) -> URL? {
    do {
      let fileManager =  FileManager.default
      let uniqueFileNameWithExtension = getUniqueFileNameWithExtension(source: source, destination: destination)

      let resourcesUrl = destination.appendingPathComponent("/" + uniqueFileNameWithExtension)
      
      try fileManager.copyItem(at: source, to: resourcesUrl)
      
      return resourcesUrl
    } catch let error {
      print("Cannot copy item at \(source) to Resources: \(error). Error: \(error.localizedDescription)")
      
      return nil
    }
  }
  
  private func getUniqueFileNameWithExtension(source: URL, destination: URL) -> String {
    let sourceExtension = "." + source.pathExtension
    let sourceFileName = source.lastPathComponent.replacingOccurrences(of: sourceExtension, with: "")
    
    let urlWithOriginalFileName = destination.appendingPathComponent(sourceFileName + sourceExtension)
    
    if !FileManager.default.fileExists(atPath: urlWithOriginalFileName.path) {
      return source.lastPathComponent
    }
        
    var copyCount = 1
    var urlToDuplicateFileName = destination.appendingPathComponent("\(sourceFileName)(\(copyCount))\(sourceExtension)")
        
    while FileManager.default.fileExists(atPath: urlToDuplicateFileName.path) {
      copyCount += 1
      
      urlToDuplicateFileName = destination.appendingPathComponent("\(sourceFileName)(\(copyCount))\(sourceExtension)")
    }
    
    return sourceFileName + "(\(copyCount))\(sourceExtension)"
  }
}
