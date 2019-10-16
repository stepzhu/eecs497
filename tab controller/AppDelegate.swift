//
//  AppDelegate.swift
//  tab controller
//
//  Created by Stephen Zhu on 10/6/19.
//  Copyright © 2019 Stephen Zhu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var homeViewController: HomeViewController!
    var faqViewController: FaqViewController!

    func application(_ application: UIApplication,
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set up the first View Controller
        let vc1 = HomeViewController()
        vc1.view.backgroundColor = UIColor.orange
        vc1.tabBarItem.title = "Home"
        vc1.tabBarItem.image = UIImage(named: "home150")
        vc1.tabBarItem.imageInsets = UIEdgeInsets.init(top: 12, left: 0, bottom: 0, right: 0)

        // Set up the second View Controller
        let vc2 = FaqViewController()
        vc2.view.backgroundColor = UIColor.purple
        vc2.tabBarItem.title = "FAQ"
        vc2.tabBarItem.image = UIImage(named: "faq150")
        vc2.tabBarItem.imageInsets = UIEdgeInsets.init(top: 12, left: 0, bottom: 0, right: 0)

        // Set up the Tab Bar Controller to have two tabs
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2]

        // Make the Tab Bar Controller the root view controller
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
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
    
}

