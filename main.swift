import UIKit

let appName: String? = NSStringFromClass(App.self)
let appDelegateName: String? = NSStringFromClass(AppDelegate.self)

_ = UIApplicationMain(CommandLine.argc,
                      CommandLine.unsafeArgv,
                      appName,
                      appDelegateName)
