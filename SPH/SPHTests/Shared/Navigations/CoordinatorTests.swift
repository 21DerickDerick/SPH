//
//  CoordinatorTests.swift
//  SPHTests
//
//  Created by Derick on 22/5/20.
//  Copyright © 2020 DerickDev. All rights reserved.
//

import XCTest
@testable import SPH

class ParentCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
}

class ChildCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
}

class SpecialCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
}

class CoordinatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppendCoordinator() {
        let parentCoordinator = ParentCoordinator()
        let firstChildCoordinator = ChildCoordinator()
        
        parentCoordinator.appendChildCoordinator(firstChildCoordinator)
        
        XCTAssertTrue(parentCoordinator.childCoordinators.count == 1)
    }
    
    func testRemoveAllCoordinator() {
        let parentCoordinator = ParentCoordinator()
        let firstChildCoordinator = ChildCoordinator()
        let secondChildCoordinator = ChildCoordinator()
        let thirdChildCoordinator = ChildCoordinator()
        
        parentCoordinator.appendChildCoordinator(firstChildCoordinator)
        parentCoordinator.appendChildCoordinator(secondChildCoordinator)
        parentCoordinator.appendChildCoordinator(thirdChildCoordinator)
        
        XCTAssertTrue(parentCoordinator.childCoordinators.count == 3)
        
        parentCoordinator.removeAllChildCoordinator()
        
        XCTAssertTrue(parentCoordinator.childCoordinators.count == 0)
    }
    
    func testChildDidFinish() {
        let parentCoordinator = ParentCoordinator()
        let firstChildCoordinator = ChildCoordinator()
        parentCoordinator.appendChildCoordinator(firstChildCoordinator)
        firstChildCoordinator.parentCoordinator = parentCoordinator
        
        XCTAssertTrue(parentCoordinator.childCoordinators.count == 1)
        
        firstChildCoordinator.parentCoordinator?.childDidFinish(firstChildCoordinator)
        
        XCTAssertTrue(parentCoordinator.childCoordinators.count == 0)
    }
    
    func testTraverseChildCoordinators() {
        let parentCoordinator = ParentCoordinator()
        let firstChildCoordinator = ChildCoordinator()
        let secondChildCoordinator = SpecialCoordinator()
        
        parentCoordinator.appendChildCoordinator(firstChildCoordinator)
        firstChildCoordinator.appendChildCoordinator(secondChildCoordinator)
        
        let coordinators = parentCoordinator.traverseChildCoordinators()
        
        var hasSpecialCoordinator = false
        
        for coordinator in coordinators {
            if coordinator is SpecialCoordinator {
                hasSpecialCoordinator = true
            }
        }
        
        XCTAssertTrue(hasSpecialCoordinator == true)
    }

}
