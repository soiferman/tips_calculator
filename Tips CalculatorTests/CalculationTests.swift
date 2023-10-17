//
//  CalculationTests.swift
//  Tips CalculatorTests
//
//  Created by Max Soiferman on 16/10/23.
//

import XCTest
@testable import Tips_Calculator

final class CalculationTests: XCTestCase {

    func testSuccessfulTipCalculation() {
        // Given (Arrange)
        let enteredAmount = 100.0
        let tipSlider = 25.0
        
        // When (Act)
        let tip = Calculation().calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertEqual(tip, 25)
        
    }
    
    func testNegativeEnteredAmountTipCalculation() {
        // Given (Arrange)
        let enteredAmount = -100.0
        let tipSlider = 25.0
        
        // When (Act)
        let tip = Calculation().calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertNil(tip)
        
    }

}
