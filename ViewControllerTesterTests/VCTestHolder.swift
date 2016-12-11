import Foundation

@objc public class VCTestHolder: NSObject {
    static let shared = VCTestHolder()
    private var testsForClass = [String: [VCTest]]()
    private var appearTestsForClass = [String: [VCTest]]()
    private var disappearTestsForClass = [String: [VCTest]]()
    private var appear: Bool? = nil
    
    public var currentViewController: UIViewController?
    public var currentClass = ""
    
    public var appearanceTests: [VCTest]? {
        return appearTestsForClass[currentClass]
    }
    
    public var disappearanceTests: [VCTest]? {
        return disappearTestsForClass[currentClass]
    }
    
    func addAppear() {
        appear = true
    }
    
    func addDisappear() {
        appear = false
    }
    
    func add(test: VCTest) {
        if let appearing = appear {
            if appearing {
                if var tests = appearTestsForClass[currentClass] {
                    tests.append(test)
                    appearTestsForClass[currentClass] = tests
                }
                else {
                    var tests = [VCTest]()
                    tests.append(test)
                    appearTestsForClass[self.currentClass] = tests
                }
            }
            else {
                if var tests = disappearTestsForClass[currentClass] {
                    tests.append(test)
                    disappearTestsForClass[currentClass] = tests
                }
                else {
                    var tests = [VCTest]()
                    tests.append(test)
                    disappearTestsForClass[self.currentClass] = tests
                }
            }
        }
    }
}


