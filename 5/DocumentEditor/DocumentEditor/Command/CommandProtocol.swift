//
//  CommandProtocol.swift
//  DocumentEditor
//
//  Created by User on 27.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

protocol CommandProtocol {
  func execute()
  func unexecute()
}
