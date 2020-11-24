//
//  Constants.swift
//  DocumentEditor
//
//  Created by User on 31.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct Constants {
  static let rootPath = #file.split(separator: "/").dropLast().joined(separator: "/")
  static let filePrefix = "file:///"
  static let resourcesPath = rootPath + "/Resources"
  static let indexPagePath = filePrefix + resourcesPath + "/index.html"
  
  static let imagesFolder = "/Images"
  static let imageExtensions = ["jpg", "jpeg", "png", "gif"]
  
  static let maxResolutionValue = 10000
  static let minResolutionValue = 0
}
