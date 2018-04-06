//
//  HeightUITests.swift
//  ConversoresUITests
//
//  Created by Vinicius Tenorio on 4/6/18.
//  Copyright © 2018 Vinicius Tenorio. All rights reserved.
//

import XCTest

class HeightUITests: XCTestCase {
        
    override func setUp() {
        // chamando metodo da classe "pai" tento as inicializacoes
        super.setUp()
        //Inicializa Application
        XCUIApplication().launch()
    }
    
    func testHeight() {
        
        let app = XCUIApplication()
        let button = app.buttons[">"]
        button.tap()
        button.tap()
        button.tap()
        
        let textField = app.otherElements.containing(.staticText, identifier:"0.0").children(matching: .other).element.children(matching: .textField).element
        textField.tap()
        XCUIApplication()/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        textField.typeText("1000")
        textField.typeText("\n")
        
        let metroButton = app.buttons["Metro"]
        metroButton.tap()
        
        XCTAssert(app.staticTexts["1.0"].exists)
        
    }
    
    
}
