//
//  AppDelegate.swift
//  WifiDetection
//
//  Created by Shubham Garg on 25/07/21.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var reach: Reachability?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.reach = Reachability.forInternetConnection()
        // Override point for customization after application launch.
        self.reach!.reachableBlock = {
                   (reach: Reachability?) -> Void in
                   
                   // keep in mind this is called on a background thread
                   // and if you are updating the UI it needs to happen
                   // on the main thread, like this:
                   DispatchQueue.main.async {
                       print("REACHABLE!")
                   }
               }
               
               self.reach!.unreachableBlock = {
                   (reach: Reachability?) -> Void in
                   print("UNREACHABLE!")
               }
               
               self.reach!.startNotifier()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

