//
//  ConversoresUITests.swift
//  ConversoresUITests
//
//  Created by Vinicius Tenorio on 12/19/17.
//  Copyright © 2017 Vinicius Tenorio. All rights reserved.
//

import XCTest

class ConversoresUITests: XCTestCase {
        
    func testConversionRealToDolar() {
        
        let app = XCUIApplication()
        app.launch()
        let button = app.buttons[">"]
        button.tap()
        button.tap()
        
        let textField = app.otherElements.containing(.staticText, identifier:"0.0").children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        textField.typeText("1")
        app.buttons["Dolar"].tap()
        
        XCTAssert(app.staticTexts["3.5"].exists)
    }
    
}


