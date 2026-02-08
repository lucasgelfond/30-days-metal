//
//  main.swift
//  cli
//
//  Created by Lucas Gelfond on 2/8/26.
//

import Foundation
import Metal

print("Hello, World!")

let device = MTLCreateSystemDefaultDevice()!


guard let library = device.makeDefaultLibrary() else {
    fatalError("Unable to create default shader library")
}

for name in library.functionNames {
    let function = library.makeFunction(name: name)!
    print("\(function)")
}


