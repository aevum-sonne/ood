//
//  ModernGraphicsRenderer.swift
//  ModernGraphicsLib
//
//  Created by User on 24.11.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import StandardStream

public class ModernGraphicsRenderer {
  public required init(stream: StandardStream) {
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
      throw RendererError.logicError("Drawing has already begun.")
    }
        
    print("<draw>", to: &stream.out)
    
    drawing = true
  }
  
  public func drawLine(start: CGPoint, end: CGPoint) throws {
    if (!drawing) {
      throw RendererError.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
    }
    
    print("\t<line fromX=\(Int(start.x)) fromY=\(Int(start.y)) toX=\(Int(end.x)) toY=\(Int(end.y)) />", to: &stream.out)
  }
  
  public func endDraw() throws {
    if (!drawing) {
      throw RendererError.logicError("Drawing has not been started.")
    }
    
    print("</draw>", to: &stream.out)

    drawing = false
  }
  
  private var stream: StandardStream
  
  private var drawing: Bool
}
