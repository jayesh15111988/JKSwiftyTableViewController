//
//  AppDelegate.swift
//  JKSwiftyTableViewController
//
//  Created by Jayesh Kawli Backup on 6/4/16.
//  Copyright © 2016 Jayesh Kawli Backup. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let random = Int(arc4random_uniform(2))
        var vc: UIViewController = UIViewController()
        
        if (random == 0) {
            let items: [Person] = [Person(firstName: "Jayesh", lastName: "kawli"), Person(firstName: "Chitali", lastName: "Mitre"), Person(firstName: "Kitali", lastName: "Ladendorf"), Person(firstName: "Tom", lastName: "Bushtosh")]
            vc = ViewController(items: items, config: { (cell, item) in
                cell.textLabel?.text = item.firstName
                cell.detailTextLabel?.text = item.lastName
                }, style: .Plain, editable: true)
        } else {
            let items: [String] = ["Jayesh kawli", "Chitali Mitre", "Kitali Ladendorf", "Tom Bushtosh"]
            vc = ViewController(items: items, config: { (cell, item) in
                cell.textLabel?.text = item
                }, style: .Plain, editable: true)
        }
        
        let nav = UINavigationController(rootViewController: vc)
        self.window = UIWindow(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

