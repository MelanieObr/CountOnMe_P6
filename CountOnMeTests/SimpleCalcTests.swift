//
//  SimpleCalcTests.swift
//  CountOnMeTests
//
//  Created by Mélanie Obringer on 15/08/2019.
//  Copyright © 2019 Mélanie Obringer. All rights reserved.
//

import XCTest
@testable import CountOnMe

class SimpleCalcTests: XCTestCase {
    
    let simpleCalc = SimpleCalc()
    
    // Test addition
    func testGivenNumbersAre2And1_WhenAdd_ThenResultIs3() {
        let inputs = ["2", "+", "1"]
        let expected = "3"
        let result = simpleCalc.didTappedEqualButton(inputs)
        XCTAssertEqual(expected, result)
    }
    // Test addition and substraction
    func testGiven2Plus1Minus3_WhenCalculate_ThenResultIs0() {
        let inputs = ["2", "+", "1", "-", "3"]
        let expected = "0"
        let result = simpleCalc.didTappedEqualButton(inputs)
        XCTAssertEqual(expected, result)
    }
    // Test division by 0 equal nil
    func testGivenAnyNumber_WhenDevidedByZero_ThenResultIsNil() {
        let inputs = ["4", "/", "0"]
        let result = simpleCalc.didTappedEqualButton(inputs)
        XCTAssertNil(result)
    }
    // Test with incomplete syntax equal nil
    func testGivenOneNumberAndOneOperator_WhenTappeEqual_ThenResultIsNil() {
        let inputs = ["4", "/"]
        let result = simpleCalc.didTappedEqualButton(inputs)
        XCTAssertNil(result)
    }
    // Test bad syntax with two operators equal nil
    func testGivenFollowingOperators_WhenTappeEqual_ThenResultIsNil() {
        let inputs = ["4", "+", "/"]
        let result = simpleCalc.didTappedEqualButton(inputs)
        XCTAssertNil(result)
    }
}
