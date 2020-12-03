//
//  main.swift
//  MultiGumballMachine
//
//  Created by User on 02.12.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import TextStream

let outStream = TextStream.OStream(type: .console)
let inStream = TextStream.IStream()

let controller = MultiGumballMachineController(inStream: inStream, outStream: outStream)

controller.run()
