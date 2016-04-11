//
//  NumberSerialTest.swift
//  Factorial
//
//  Created by Jason Zheng on 3/21/16.
//  Copyright © 2016 Jason Zheng. All rights reserved.
//

import XCTest
import Foundation

class NumberSerialTest: XCTestCase {
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testSetAndString() {
        let num = NumberSerial()
        let num2 = NumberSerial()
        
        // Test for set by num and stringOfFullNumber
        num.setBy(0)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(1)
        XCTAssertEqual(num.stringOfFullNumber(), "1")
        
        num.setBy(9)
        XCTAssertEqual(num.stringOfFullNumber(), "9")
        
        num.setBy(10)
        XCTAssertEqual(num.stringOfFullNumber(), "10")
        
        num.setBy(99)
        XCTAssertEqual(num.stringOfFullNumber(), "99")
        
        num.setBy(100)
        XCTAssertEqual(num.stringOfFullNumber(), "100")
        
        num.setBy(38283)
        XCTAssertEqual(num.stringOfFullNumber(), "38283")
        
        // Test for set by NumberSerial and stringOfFullNumber
        num.setBy(0)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "0")
        
        num.setBy(1)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "1")
        
        num.setBy(9)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "9")
        
        num.setBy(10)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "1.0e1")
        
        num.setBy(99)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "9.9e1")
        
        num.setBy(100)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "1.00e2")
        
        num.setBy(38283)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "3.8283e4")
        
        num.setBy(8938298813)
        num2.setBy(num)
        XCTAssertEqual(num2.stringByScientificNotation(), "8.93829881e9")
    }
    
    func testAdd() {
        let num = NumberSerial()
        let num2 = NumberSerial()
        
        num.setBy(0)
        num2.setBy(0)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(0)
        num2.setBy(9)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "9")
        
        num.setBy(0)
        num2.setBy(10)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "10")
        
        num.setBy(0)
        num2.setBy(99)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "99")
        
        num.setBy(9)
        num2.setBy(0)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "9")
        
        num.setBy(9)
        num2.setBy(1)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "10")
        
        num.setBy(99)
        num2.setBy(99)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "198")
        
        num.setBy(2341)
        num2.setBy(23)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "2364")
        
        num.setBy(828)
        num2.setBy(349)
        num.addBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "1177")
    }
    
    func testMultiplyByNumber() {
        let num = NumberSerial()
        
        num.setBy(0)
        num.multiplyBy(0)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(0)
        num.multiplyBy(9)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(1)
        num.multiplyBy(0)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(1)
        num.multiplyBy(1)
        XCTAssertEqual(num.stringOfFullNumber(), "1")
        
        num.setBy(1)
        num.multiplyBy(10)
        XCTAssertEqual(num.stringOfFullNumber(), "10")
        
        num.setBy(2)
        num.multiplyBy(3)
        XCTAssertEqual(num.stringOfFullNumber(), "6")
        
        num.setBy(6)
        num.multiplyBy(8)
        XCTAssertEqual(num.stringOfFullNumber(), "48")
        
        num.setBy(281)
        num.multiplyBy(94010)
        XCTAssertEqual(num.stringOfFullNumber(), "26416810")
    }
    
    func testMultiplyByNumberSerial() {
        let num = NumberSerial()
        let num2 = NumberSerial()
        
        num.setBy(0)
        num2.setBy(0)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(0)
        num2.setBy(9)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(1)
        num2.setBy(0)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(1)
        num2.setBy(1)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "1")
        
        num.setBy(1)
        num2.setBy(10)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "10")
        
        num.setBy(2)
        num2.setBy(3)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "6")
        
        num.setBy(6)
        num2.setBy(8)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "48")
        
        num.setBy(281)
        num2.setBy(94010)
        num.multiplyBy(num2)
        XCTAssertEqual(num.stringOfFullNumber(), "26416810")
    }
    
    func testMultiplyByExp() {
        let num = NumberSerial()
        
        num.setBy(0)
        num.multiplyBy10Exp(0)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(0)
        num.multiplyBy10Exp(1)
        XCTAssertEqual(num.stringOfFullNumber(), "0")
        
        num.setBy(1)
        num.multiplyBy10Exp(0)
        XCTAssertEqual(num.stringOfFullNumber(), "1")
        
        num.setBy(1)
        num.multiplyBy10Exp(1)
        XCTAssertEqual(num.stringOfFullNumber(), "10")
        
        num.setBy(1)
        num.multiplyBy10Exp(2)
        XCTAssertEqual(num.stringOfFullNumber(), "100")
        
        num.setBy(23)
        num.multiplyBy10Exp(6)
        XCTAssertEqual(num.stringOfFullNumber(), "23000000")
    }
}