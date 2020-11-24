//
//  DocumentItem.swift
//  DocumentEditor
//
//  Created by User on 28.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class DocumentItem: DocumentItemProtocol {
  private(set) var paragraph: ParagraphProtocol?
  private(set) var image: ImageProtocol?
  
  init(paragraph: ParagraphProtocol) {
    self.paragraph = paragraph
  }
  
  init(image: ImageProtocol) {
    self.image = image
  }
  
  deinit {
    self.image = nil
  }
}
