import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .spotifyBlack
        window?.makeKeyAndVisible()
        
//        let navigationController = UINavigationController(rootViewController: TitleBarController())
//        window?.rootViewController =  navigationController
        
        window?.rootViewController = HomeController()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .spotifyBlack
        return true
    }
}

