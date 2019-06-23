
import UIKit

class MainStory: Story {
    
    // Cooodinators
    var Cx00: AppCoordinator? = AppCoordinator.shared
    var Cx01: RootCoordinator?
    var Cx02: MakingShopTypesCoordinator?
    
    func begin() {
        
        Cx00?.delegate = self
        Cx00?.start()
    }
}

extension MainStory: AppCoordinatorDelegate {
    
    func didStarted(window: UIWindow) {
        
        print("😎: yeah launched within our control.")
        
        Cx01 = RootCoordinator(window: window)
        Cx01?.delegate = self
        Cx01?.start()
    }
    
    func didFailStarting() {
        
        print("😱: failed to start App. (🤔) ")
    }
}

extension MainStory: RootCoordinatorDelegate {
    
    func didStarted(viewController: Page0) {
        
        Cx02 = MakingShopTypesCoordinator()
        Cx02?.delegate = self
        Cx02?.start()
    }
}


extension MainStory: MakingShopTypesCoordinatorDelegate {
    
    func didStarted(viewController: ShopTypeViewController) {
        
        // Repository Pattern
        let data = ShopTypeSelection(value: [
            (ShopType(name: "Gold Merchant"), true),
            (ShopType(name: "Official Store"), false),
            ])
        
        // let data = Data.access.DefaultShopTypeSelection
        
        let story  = MakingShopTypes(view: viewController)
        story.data = data
        story.delegate = self
        story.begin()
    }
}


extension MainStory: MakingShopTypesDelegate {
    
    func canceled() {
        
        print("making shop types has been canceled")
        Cx02?.presentee?.dismiss(animated: true, completion: nil)
    }
    
    func end(with selections: ShopTypeSelection?) {
        
        print("we got selections", selections ?? "None")
        Cx02?.presentee?.dismiss(animated: true, completion: nil)
        
        if let selections = selections {
            (Cx01?.presentee as! Page0).updateList(with: selections)
        }
    }
}
