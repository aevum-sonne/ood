//
//  ImageProtocol.swift
//  DocumentEditor
//
//  Created by User on 26.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol ImageProtocol {
  var path: String { get }
  
  var width: Int { get }
  var height: Int { get }
  
  func resize(width: Int, height: Int)
}
