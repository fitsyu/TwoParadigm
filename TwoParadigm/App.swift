//
//  App.swift
//  TwoParadigm
//
//  Created by Fitsyu  on 22/06/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit

class App: UIApplication {}

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    var Cx00: RootCoordinator?
    var Cx01: MakingShopTypesCoordinator?

    func application(_
        application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)
        -> Bool {
        
        Cx00 = RootCoordinator()
        Cx00?.delegate = self
        Cx00?.start()
        
        return false // we don't handle url currently
    }
}

extension AppDelegate: RootCoordinatorDelegate {
    
    func didStarted(viewController: Page0) {
        
        Cx01 = MakingShopTypesCoordinator()
        Cx01?.delegate = self
        Cx01?.start()
    }
}

extension AppDelegate: MakingShopTypesCoordinatorDelegate {
    
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

//  navigation
extension AppDelegate: MakingShopTypesDelegate {

    func canceled() {
        print("making shop types has been canceled")
        Cx01?.presentee?.dismiss(animated: true, completion: nil)
    }

    func end(with selections: ShopTypeSelection?) {
        print("we got selections", selections ?? "None")
        Cx01?.presentee?.dismiss(animated: true, completion: nil)
        (Cx00?.presentee as! Page0).updateList(with: selections!)
    }
}


