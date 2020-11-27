//
//  main.swift
//  App
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import App

print("Should we use new API (y)?")

if (readLine()?.lowercased() == "y") {
  App.paintPictureOnModernGraphicsRenderer()
} else {
  App.paintPictureOnCanvas()
}
