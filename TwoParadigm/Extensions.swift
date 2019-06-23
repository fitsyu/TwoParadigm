import UIKit

extension UIApplication {
    
    func topMost() -> UIViewController? {
        
        var top: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        
        while top?.presentedViewController != nil {
            top = top?.presentedViewController
        }
        
        return top
    }
}

extension UIViewController {
    
    func viewFromNib(named name: String) -> UIView? {
        
        let nib = UINib(nibName: name, bundle: nil)
        
        let nibContents = nib.instantiate(withOwner: self, options: nil)
        
        guard let first = nibContents.first,
            let viewOfNib = first as? UIView else {
                return nil
        }
        
        return viewOfNib
    }
}
