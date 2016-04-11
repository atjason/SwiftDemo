//
//  FactorialTest.swift
//  FactorialTest
//
//  Created by Jason Zheng on 3/20/16.
//  Copyright © 2016 Jason Zheng. All rights reserved.
//

import XCTest
import Factorial

class FactorialTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFactorial() {
        var num = NumberSerial()
        
        num = Factorial.calculateFactorial(0)
        XCTAssertEqual(num.stringOfFullNumber(), "1")
        
        num = Factorial.calculateFactorial(1)
        XCTAssertEqual(num.stringOfFullNumber(), "1")
        
        num = Factorial.calculateFactorial(2)
        XCTAssertEqual(num.stringOfFullNumber(), "2")
        
        num = Factorial.calculateFactorial(3)
        XCTAssertEqual(num.stringOfFullNumber(), "6")
        
        num = Factorial.calculateFactorial(10)
        print(num.stringOfFullNumber())
        XCTAssertEqual(num.stringOfFullNumber(), "3628800")
        
        num = Factorial.calculateFactorial(50)
        XCTAssertEqual(num.stringByScientificNotation(), "3.04140932e64")
    }
    
    func testFactorialPerformance() {
        self.measureBlock {
            Factorial.calculateFactorial(10)
        }
    }
}
