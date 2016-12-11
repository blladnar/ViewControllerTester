import XCTest
import Nimble
import Quick

public class VCTest: NSObject {
    init(name: String, _ test: @escaping ()->()) {
        self.test = test
        self.name = name
    }
    
    func run() {
        test()
    }
    
    private var test: ()->()
    var name: String
}

func vc(_ description: String, _ test:@escaping ()->()) {
    VCTestHolder.shared.add(test: VCTest(name:description, test))
}

func viewAppears(_ test:@escaping ()->()) {
    VCTestHolder.shared.addAppear()
    test()
}

func viewDisappears(_ test:@escaping ()->()) {
    VCTestHolder.shared.addDisappear()
    test()
}

func testViewController(_ viewController: UIViewController, _ test: ()->()) {
    VCTestHolder.shared.currentViewController = viewController
    test()
}


//class ViewControllerTestCase2: QuickSpec {
//    private var appears: (() -> ())?
//    private var disappears: (() -> ())?
//    
//    func testViewController(_ viewController: UIViewController, test: () -> ()) {
//        //let className = String(describing: Mirror(reflecting: viewController).subjectType)
//        
//        test()
//        
//        UIApplication.shared.delegate?.window??.rootViewController = viewController
//        expect(true).toEventually(beTrue())
//        
//        appears?()
//        
//        
//        UIApplication.shared.delegate?.window??.rootViewController = UIViewController()
//        expect(true).toEventually(beTrue())
//        
//        disappears?()
//    }
//    
//    func viewAppears(_ appear: @escaping () -> ()) {
//        appears = appear
//        
//    }
//    
//    func test(_ description: String, _ test: () throws -> ()) {
//        do {
//            try test()
//        } catch {
//            print("Failed")
//        }
//        
//    }
//    
//    func viewDisappears( _ disappear: @escaping () -> ()) {
//        disappears = disappear
//    }
//}
