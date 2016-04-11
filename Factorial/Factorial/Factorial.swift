//
//  Factorial.swift
//  Factorial
//
//  Created by Jason Zheng on 3/20/16.
//  Copyright © 2016 Jason Zheng. All rights reserved.
//

import Foundation

class Factorial {
    
    static func calculateFactorial(number: UInt) -> NumberSerial {
        
        let numberSerialResult = NumberSerial()
        let numberSerialMultiplier = NumberSerial()
        
        if number == 0 || number == 1 {
            numberSerialResult.setBy(1)
            
        } else {
            numberSerialResult.setBy(1)
            
            for i in 1...number {
                numberSerialMultiplier.setBy(Int(i))
                numberSerialResult.multiplyBy(numberSerialMultiplier)
            }
        }
        
        return numberSerialResult
    }
}
