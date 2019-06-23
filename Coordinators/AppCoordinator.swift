//
//  AppCoordinator.swift
//  TwoParadigm
//
//  Created by Fitsyu  on 23/06/19.
//  Copyright © 2019 Fitsyu . All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var delegate: AppCoordinatorDelegate?
    
    let presentee: UIViewController? = nil
    
    func start() {
        
        UIApplicationMain(CommandLine.argc,
                          CommandLine.unsafeArgv,
                          NSStringFromClass(App.self),
                          NSStringFromClass(AppDelegate.self))
    }
    
    func start(from top: UIViewController?) {
        fatalError("not applicable")
    }
    
    private init() {}
    private static var _instance: AppCoordinator!
    public static var shared: AppCoordinator {
        
        if _instance == nil {
            _instance = AppCoordinator()
        }
        
        return _instance
    }
}

protocol AppCoordinatorDelegate {
    
    func didStarted(window: UIWindow)
    
    func didFailStarting()
}



