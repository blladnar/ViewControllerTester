import XCTest
import Nimble
import Quick

class ViewControllerTestCase: QuickSpec {
    private var appears: (() -> ())?
    private var disappears: (() -> ())?
    
    func testViewController(_ viewController: UIViewController, test: () -> ()) {
        let className = String(describing: Mirror(reflecting: viewController).subjectType)
        describe("\(className) UI Test") {
            test()
            
            UIApplication.shared.delegate?.window??.rootViewController = viewController
            expect(true).toEventually(beTrue())
            context("when the view appears") {
                appears?()
            }
            
            UIApplication.shared.delegate?.window??.rootViewController = UIViewController()
            expect(true).toEventually(beTrue())
            context("when the view disappears") {
                disappears?()
            }
        }
        
    }
    
    func viewAppears(_ appear: @escaping () -> ()) {
        appears = appear
        
    }
    
    func viewDisappears( _ disappear: @escaping () -> ()) {
        disappears = disappear
    }
}
