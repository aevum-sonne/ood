//
//  ModernGraphicsRenderer.swift
//  ModernGraphicsLibPro
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import StandardStream

public class ModernGraphicsRendererPro {
  public init(stream: StandardStream) {
    self.stream = stream
    
    drawing = false
  }
  
  deinit {
    if (drawing) {
      try! endDraw()
    }
  }
  
  public func beginDraw() throws {
    if (drawing) {
      throw ModernRendererError.logicError("Drawing has already begun.")
    }
        
    print("<draw>", to: &stream.out)
    
    drawing = true
  }
  
  public func drawLine(start: CGPoint, end: CGPoint, color: RGBAColor) throws {
    if (!drawing) {
      throw ModernRendererError.logicError("Drawing has not been started.")
    }
    
    print("\t<line fromX=\(Int(start.x)) fromY=\(Int(start.y)) toX=\(Int(end.x)) toY=\(Int(end.y))>", to: &stream.out)
    print("\t\t<color r=\(color.r) g=\(color.g) b=\(color.b) a=\(color.a)>", to: &stream.out)
    print("\t</line>", to: &stream.out)
  }
  
  public func endDraw() throws {
    if (!drawing) {
      throw ModernRendererError.logicError("Drawing has not been started.")
    }
    
    print("</draw>", to: &stream.out)

    drawing = false
  }
  
  private let stream: StandardStream
  
  private var drawing: Bool
}
