//
//  ViewControllerTesterTests.swift
//  ViewControllerTesterTests
//
//  Created by Randall Brown on 12/8/16.
//  Copyright © 2016 Randall Brown. All rights reserved.
//

import XCTest
import Nimble
import Quick
@testable import ViewControllerTester

class FakeViewController: UIViewController {
    var viewDidLoadBool = false
    var viewDidAppearBool = false
    var viewWillDisappearBool = false
    override func viewDidAppear(_ animated: Bool) {
        viewDidAppearBool = true
    }
    
    override func viewDidLoad() {
        viewDidLoadBool = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        viewWillDisappearBool = true
    }
}


class ViewControllerSpec: ViewControllerTestCase {
    override func spec() {
        context("when this happend") {
            it("should be true") {
                expect(true).to(beTrue())
            }
        }
        
        let viewController = FakeViewController()
        
        testViewController(viewController) {
            viewAppears {

                it("should set the view did load bool") {
                    expect(viewController.viewWillDisappearBool).to(beTrue())
                }
                
                XCTAssertTrue(viewController.viewDidAppearBool)
            }
            
            viewDisappears {
                XCTAssertTrue(viewController.viewWillDisappearBool)
            }
        }
    }
}
