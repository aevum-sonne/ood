//
//  ShapeFactoryProtocol.swift
//  DesignersFactory
//
//  Created by User on 13.10.2020.
//  Copyright © 2020 User. All rights reserved.


import Foundation

protocol ShapeFactoryProtocol {
   func createShape(description: String) throws -> ShapeProtocol
}
