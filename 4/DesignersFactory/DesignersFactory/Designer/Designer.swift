//
//  Designer.swift
//  DesignersFactory
//
//  Created by User on 14.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

class Designer {
  init(factory: ShapeFactory) {
    self.factory = factory
  }

  func createDraft(tasks: [String]) -> PictureDraft {
    let draft = PictureDraft()

    for taskDescription in tasks {
      do {
        let shape = try factory.createShape(description: String(taskDescription))
        draft.addShape(shape: shape)
      }

      catch let factoryError as FactoryError {
        handle(factoryError: factoryError)
      }

      catch let error {
        print(error.localizedDescription)
      }
    }

    return draft
  }
  
  private let factory: ShapeFactory
}
