//
//  ParagraphProtocol.swift
//  DocumentEditor
//
//  Created by User on 26.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol ParagraphProtocol {
  var value: String { get }
  
  func setText(value: String)
}
