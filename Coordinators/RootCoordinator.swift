
import UIKit

class RootCoordinator: Coordinator {
    
    var presentee: UIViewController?
    
    var delegate: RootCoordinatorDelegate?
    
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        // load
        let page0 = Page0()
        
        // navigate
        window.rootViewController = page0
        window.makeKeyAndVisible()
        
        // done
        self.delegate?.didStarted(viewController: page0)
        
        // save
        presentee = page0
    }
    
    func start(from top: UIViewController?) {
        fatalError("root should be root. no one go below it")
    }

}

protocol RootCoordinatorDelegate {
    
    func didStarted(viewController: Page0)
}
