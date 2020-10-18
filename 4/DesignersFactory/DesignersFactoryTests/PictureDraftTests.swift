//
//  PictureDraftTests.swift
//  DesignersFactoryTests
//
//  Created by User on 16.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

@testable import DesignersFactory

import XCTest

class PictureDraftTests: XCTestCase {

  func testDraft() {
    let shape = Rectangle(frame: CGRect(x: 0, y: 0, width: 1000, height: 1000), color: .black, leftTop: CGPoint(x: 66, y: 66), width: 133, height: 133)
    
    let draft = PictureDraft()
    draft.addShape(shape: shape)
    
    XCTAssertEqual(shape, draft.shapes[0])
  }

}
