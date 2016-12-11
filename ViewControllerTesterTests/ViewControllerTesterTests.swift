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
import KIF

@testable import ViewControllerTester

extension XCTestCase {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

extension KIFTestActor {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

class FakeViewController: UIViewController {
    var viewDidLoadBool = false
    var viewDidAppearBool = false
    var viewWillDisappearBool = false
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
    override func viewDidAppear(_ animated: Bool) {
        viewDidAppearBool = true
    }
    
    override func viewDidLoad() {
        print("Fake View Did Load")
        super.viewDidLoad()
        
        viewDidLoadBool = true
        label.accessibilityLabel = "Label"
        view.addSubview(label)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Fake View Will disappear")
        viewWillDisappearBool = true
        label.removeFromSuperview()
    }
}

class Quickly: QuickSpec {
    override func spec() {
        it("Should fail") {
//            self.tester().waitForView(withAccessibilityLabel: "adfaa")
        }
    }
}

class ViewControllerSpec: ViewControllerTestCase {
    
    override func spec() {
        let viewController = FakeViewController()
        
        testViewController(viewController) {
            viewAppears {
                vc("should set the view did load bool") {
                    expect(viewController.viewDidLoadBool).to(beTrue())
                    self.tester().waitForView(withAccessibilityLabel: "sadf")
                    
                }
                
                vc("should only load the view once") {
                    expect(true).to(beTrue())
                }
            }
            
            viewDisappears {
                vc("should set the view will disappear bool") {
                    expect(viewController.viewWillDisappearBool).to(beTrue())
                }
            }
        }
    }
}
