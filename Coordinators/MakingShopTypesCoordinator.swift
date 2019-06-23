
import UIKit

class MakingShopTypesCoordinator: Coordinator {
    
    var delegate: MakingShopTypesCoordinatorDelegate?
    
    var presentee: UIViewController?
    
    private var presenter: UIViewController?
    
    func start() {
        
        // load
        let vx = ShopTypeViewController()
        
        // navigate
        UIApplication.shared.topMost()?.present(vx, animated: true, completion: nil)
        
        delegate?.didStarted(viewController: vx)
        
        presentee = vx
    }
    
    func start(from top: UIViewController?) {
        
        // load
        let vx = ShopTypeViewController()
        
        // navigate
        top?.present(vx, animated: true, completion: nil)
        
        delegate?.didStarted(viewController: vx)
        
        // save
        presentee = vx
    }
}


protocol MakingShopTypesCoordinatorDelegate {
    
    func didStarted(viewController: ShopTypeViewController)
}
