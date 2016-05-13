//
//  AppDelegate.swift
//  SwiftyJSONAccelerator
//
//  Created by Karthik on 16/10/2015.
//  Copyright © 2015 Karthikeya Udupa K M. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {
    
    var jsonString = ""

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        NSUserNotificationCenter.defaultUserNotificationCenter().delegate = self
        let url = NSURL(string:"https://1678-dev3-2016.firebaseio.com/")
        var defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        var dataTask: NSURLSessionDataTask?
        dataTask = defaultSession.dataTaskWithURL(url!) {
            data, response, error in
            if let error =  error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    self.jsonString = String(data)
                    print(String(data))
                }
            }
            }
        print(jsonString)
    }
    
    }

    func userNotificationCenter(center: NSUserNotificationCenter, shouldPresentNotification notification: NSUserNotification) -> Bool {
        return true
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }



