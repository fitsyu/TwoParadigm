import UIKit

// Coordinator
protocol Coordinator {
    
    var presentee: UIViewController? { get }
    
    func start()
    
    func start(from top: UIViewController?)
}
