//
//  TestFunctions.swift
//  DocumentEditorTests
//
//  Created by User on 28.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class TestFunctions {
  static func deleteImage(filename: String) {
    let imageResourcesUrl = URL(string: Constants.filePrefix + Constants.resourcesPath + Constants.imagesFolder + "/\(filename)")
    try! FileManager.default.removeItem(at: imageResourcesUrl!)
  }
}
