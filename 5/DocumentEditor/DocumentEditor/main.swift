//
//  main.swift
//  DocumentEditor
//
//  Created by User on 26.10.2020.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

let stream = StandardStream()
var editor = DocumentEditor(stream: stream)

editor.start()
