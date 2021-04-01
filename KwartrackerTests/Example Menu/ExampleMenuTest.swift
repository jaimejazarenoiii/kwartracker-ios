//
//  ExampleMenuTest.swift
//  KwartrackerTests
//
//  Created by Jacob on 4/1/21.
//

import XCTest
@testable import Kwartracker

class ExampleMenuTest: XCTestCase {
    var state: ExampleMenuState!

    override func setUp() {
        super.setUp()
        state = ExampleMenuState.example
    }

    override func tearDown() {
        state = nil
        super.tearDown()
    }

    func testSuccessfulAddingOfNewMenu() {
        // Inputs
        let newMenu = MenuItem(id: UUID(), name: "Bola-bola", price: 15)

        // Process
        _ = ExampleMenuReducer.reducer(state: &state, action: .add(item: newMenu), environment: World())

        // Assert
        XCTAssert(state.menu.contains(where: { $0.id == newMenu.id }))
    }

    func testSuccessfulDeletionOfMenuItem() {
        // Inputs
        let newMenu = MenuItem(id: UUID(), name: "Bola-bola", price: 15)

        // Process
        _ = ExampleMenuReducer.reducer(state: &state, action: .add(item: newMenu), environment: World())
        if let index = state.menu.enumerated().first(where: { $0.element.id == newMenu.id })?.offset {
            _ = ExampleMenuReducer.reducer(state: &state, action: .delete(index: index), environment: World())
        }

        // Assert
        XCTAssertFalse(state.menu.contains(where: { $0.id == newMenu.id }))
    }

    func testFailureDeletionOfMenuItem() {
        // Inputs
        let newMenu = MenuItem(id: UUID(), name: "Bola-bola", price: 15)

        // Process
        _ = ExampleMenuReducer.reducer(state: &state, action: .add(item: newMenu), environment: World())
        let index = 100
        _ = ExampleMenuReducer.reducer(state: &state, action: .delete(index: index), environment: World())

        // Assert
        XCTAssert(state.menu.contains(where: { $0.id == newMenu.id }))
    }

    func testSuccessfulEditOfMenuItem() {
        // Inputs
        var newMenu = MenuItem(id: UUID(), name: "Bola-bola", price: 15)

        // Process
        _ = ExampleMenuReducer.reducer(state: &state, action: .add(item: newMenu), environment: World())

        // Edit the price
        newMenu.price = 20

        // Execute update
        _ = ExampleMenuReducer.reducer(state: &state, action: .edit(item: newMenu), environment: World())

        // Assert
        XCTAssert(state.menu.contains(where: { $0 == newMenu }))
    }

    func testFailureEditOfMenuItem() {
        // Inputs
        var newMenu = MenuItem(id: UUID(), name: "Bola-bola", price: 15)

        // Process
        newMenu.price = 20

        // Execute update
        _ = ExampleMenuReducer.reducer(state: &state, action: .edit(item: newMenu), environment: World())

        // Assert
        XCTAssertFalse(state.menu.contains(where: { $0 == newMenu }))
    }
}
