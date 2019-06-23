
import UIKit

class RootCoordinator: Coordinator {
    
    var presentee: UIViewController?
    
    var delegate: RootCoordinatorDelegate?
    
    func start(from top: UIViewController?) {
        fatalError("root should be root. no one go below it")
    }
    
    
    func start() {
        
        // load
        let page0 = Page0()
        
        // navigate
        var window = UIApplication.shared.keyWindow
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = page0
        window?.makeKeyAndVisible()
        
        // done
        self.delegate?.didStarted(viewController: page0)
        
        // save
        presentee = page0
    }
}

protocol RootCoordinatorDelegate {
    
    func didStarted(viewController: Page0)
}
