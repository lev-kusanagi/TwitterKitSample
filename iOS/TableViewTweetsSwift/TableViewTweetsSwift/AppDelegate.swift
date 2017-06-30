//
//  AppDelegate.swift
//  TableViewTweetsSwift
//
//  Created by Gareth Jones  on 11/26/14.
//  Copyright (c) 2014 Twitter. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var consumer_key: String = ""
    var consumer_secret: String = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // grab app keys from Twitter.plist in app bundle
        // avoids having to have that file in source control...
        if let url = Bundle.main.url(forResource:"Twitter", withExtension: "plist") {
            do {
                let data = try Data(contentsOf:url)
                let swiftDictionary = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
                consumer_key = swiftDictionary["consumer_key"] as! String
                consumer_secret = swiftDictionary["consumer_secret"] as! String
            } catch {
                print(error)
            }
        }
        
        // Intialize Twitter Kit
        Twitter.sharedInstance().start(withConsumerKey:consumer_key, consumerSecret:consumer_secret)

        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

