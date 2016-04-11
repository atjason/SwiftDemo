//
//  main.swift
//  Factorial
//
//  Created by Jason Zheng on 3/20/16.
//  Copyright © 2016 Jason Zheng. All rights reserved.
//

import Foundation

let num = UInt(10)
let numSerial = Factorial.calculateFactorial(num)

print("\(num)! = \(numSerial.stringByScientificNotation())")
print("\(num)! = \(numSerial.stringOfFullNumber())")

print("Finished.")

