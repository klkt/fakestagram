//
//  AppDelegate.swift
//  Fakestagram
//
//  Created by Kenny Lim on 11/14/17.
//  Copyright © 2017 Kenny Lim. All rights reserved.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        addNotificationObservers()
        
        if Auth.auth().currentUser != nil {
            goToMain()
        } else {
            goToAuth()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func addNotificationObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(authSuccessNotifactionHandler), name: Notification.Name(rawValue: "AuthLogin"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(logOutSuccessNotifactionHandler), name: Notification.Name(rawValue: "AuthLogout"), object: nil)
    }
    @objc func authSuccessNotifactionHandler(notification: Notification){
        print("Notification Recived")
        goToMain()
    }
    func goToMain() {
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController
        window?.rootViewController = VC
        self.window?.makeKeyAndVisible()
    }
    @objc func logOutSuccessNotifactionHandler(notification: Notification){
        print("Notification Recived")
        goToAuth()
    }
    
    func goToAuth() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainView = LoginViewController(nibName: nil, bundle: nil)
        let nav = UINavigationController()
        nav.viewControllers = [mainView]
        self.window!.rootViewController = nav
        self.window?.makeKeyAndVisible()
    }


}

