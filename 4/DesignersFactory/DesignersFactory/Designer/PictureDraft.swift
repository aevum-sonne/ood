//
//  PictureDraft.swift
//  DesignersFactory
//
//  Created by User on 14.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class PictureDraft {
  private(set) var shapes = [ShapeProtocol]()
  
  func addShape(shape: ShapeProtocol) {
    shapes.append(shape)
  }
}
