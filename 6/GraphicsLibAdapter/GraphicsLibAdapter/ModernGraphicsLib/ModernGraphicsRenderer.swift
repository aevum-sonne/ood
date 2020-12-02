//
//  ModernGraphicsRenderer.swift
//  ModernGraphicsLib
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

public class ModernGraphicsRenderer {
  public required init(outStream: TextStream.OStream) {
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
      throw RendererError.logicError("Drawing has already begun.")
    }
        
    print("<draw>", to: &out.stream)
    
    drawing = true
  }
  
  public func drawLine(start: CGPoint, end: CGPoint) throws {
    if (!drawing) {
      throw RendererError.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
    }
    
    print("\t<line fromX=\(Int(start.x)) fromY=\(Int(start.y)) toX=\(Int(end.x)) toY=\(Int(end.y)) />", to: &out.stream)
  }
  
  public func endDraw() throws {
    if (!drawing) {
      throw RendererError.logicError("Drawing has not been started.")
    }
    
    print("</draw>", to: &out.stream)

    drawing = false
  }
  
  private var out: TextStream.OStream
  
  private var drawing: Bool
}
