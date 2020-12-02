//
//  ModernGraphicsRenderer.swift
//  ModernGraphicsLibPro
//
//  Created by User on 26.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

public class ModernGraphicsRendererPro {
  public init(outStream: TextStream.OStream) {
    self.out = outStream
    
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
        
    print("<draw>", to: &out.stream)
    
    drawing = true
  }
  
  public func drawLine(start: CGPoint, end: CGPoint, color: RGBAColor) throws {
    if (!drawing) {
      throw ModernRendererError.logicError("Drawing has not been started.")
    }
    
    print("\t<line fromX=\(Int(start.x)) fromY=\(Int(start.y)) toX=\(Int(end.x)) toY=\(Int(end.y))>", to: &out.stream)
    print("\t\t<color r=\(color.r) g=\(color.g) b=\(color.b) a=\(color.a)>", to: &out.stream)
    print("\t</line>", to: &out.stream)
  }
  
  public func endDraw() throws {
    if (!drawing) {
      throw ModernRendererError.logicError("Drawing has not been started.")
    }
    
    print("</draw>", to: &out.stream)

    drawing = false
  }
  
  private let out: TextStream.OStream
  
  private var drawing: Bool
}
