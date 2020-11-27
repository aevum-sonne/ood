//
//  ModernRendererError.swift
//  ModernGraphicsLibPro
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

enum ModernRendererError: Error {
  case logicError(String)
}

extension ModernRendererError: LocalizedError {
  public var localizedDescription: String? {
    switch self {
      case .logicError(let message):
        return message
    }
  }
}
