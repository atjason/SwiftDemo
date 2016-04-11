//
//  NumberSerial.swift
//  Factorial
//
//  Created by Jason Zheng on 3/20/16.
//  Copyright © 2016 Jason Zheng. All rights reserved.
//

import Foundation

class NumberSerial {
    
    private var serial = [Int]()
    
    private static let significandLength = 9
    
    func setBy(number: Int) {
        
        serial.removeAll()
        
        if number < 0 {
            print("ERROR: Can't set by nagative number.")
            
        } else if number < 10 {
            serial.append(number)
            
        } else {
            var num = number
            
            while num > 0 {
                serial.append(num % 10)
                
                num /= 10
            }
        }
    }
    
    func setBy(numberSerial: NumberSerial) {
        serial = numberSerial.serial
    }
    
    func stringOfFullNumber() -> String {
        var str = ""
        
        if serial.isEmpty {
            print("ERROR: NumberSerial is empty.")
            
        } else {
            for singleNumber in serial {
                str = String(singleNumber) + str
            }
        }
        
        return str
    }
    
    func stringByScientificNotation() -> String {
        var str = ""
        
        if serial.isEmpty {
            print("ERROR: NumberSerial is empty.")
            
        } else if serial.count == 1 {
            str = String(serial[0])
            
        } else {
            var index = serial.count - 1
            str = String(serial[index]) + "."
            index -= 1
            
            let loops = min(serial.count, NumberSerial.significandLength) - 1
            for _ in 0..<loops {
                str += String(serial[index])
                index -= 1
            }
            
            str += "e" + String(serial.count - 1)
        }
        
        return str
    }
    
    func addBy(numberSerial: NumberSerial) {
        
        var sumSerial = [Int]()
        
        var sum = 0
        var carry = 0
        
        let loops = max(serial.count, numberSerial.serial.count)
        
        for i in 0 ..< loops {
            sum = carry
            
            if i < serial.count {
                sum += serial[i]
            }
            
            if i < numberSerial.serial.count {
                sum += numberSerial.serial[i]
            }
            
            sumSerial.append(sum % 10)
            carry = sum / 10
        }
        
        if carry > 0 {
            sumSerial.append(carry)
        }
        
        serial = sumSerial
    }
    
    func multiplyBy(numberSerial: NumberSerial) {
        
        let numberSerialSum = NumberSerial()
        let numberSerialMultiplier = NumberSerial()
        
        var exp = 0
        
        for num in numberSerial.serial {
            numberSerialMultiplier.setBy(self)
            
            numberSerialMultiplier.multiplyBy(num)
            
            numberSerialMultiplier.multiplyBy10Exp(exp)
            exp += 1
            
            numberSerialSum.addBy(numberSerialMultiplier)
        }
        
        self.setBy(numberSerialSum)
    }
    
    func multiplyBy(number: Int) {
        
        switch number {
        case let num where num < 0:
            print("ERROR: Can't multiply by negative number.")
            
        case 0:
            self.setBy(0)
            
        case 1:
            break
            
        default:
            var carry = 0
            
            for i in 0..<serial.count {
                let sum = serial[i] * number + carry
                
                serial[i] = sum % 10
                carry = sum / 10
            }
            
            if carry > 0 {
                serial.append(carry)
            }
        }
    }
    
    func multiplyBy10Exp(number: Int) {
        if serial.count > 0 && serial.last != 0 {
            for _ in 0..<number {
                serial.insert(0, atIndex: 0)
            }
        }        
    }
}
