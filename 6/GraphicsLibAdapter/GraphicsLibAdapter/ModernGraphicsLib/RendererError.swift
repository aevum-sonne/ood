//
//  RendererError.swift
//  ModernGraphicsLib
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

enum RendererError: Error {
  case logicError(String)
}

extension RendererError: LocalizedError {
  public var localizedDescription: String? {
    switch self {
      case .logicError(let message):
        return message
    }
  }
}
