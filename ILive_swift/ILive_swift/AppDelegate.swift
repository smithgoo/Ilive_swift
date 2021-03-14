//
//  AppDelegate.swift
//  ILive_swift
//
//  Created by 王朋 on 2021/3/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        FrontModel.api_reqAction("https://okzy.co/?m=vod-type-id-1.html") { msg in
//           print(msg)
            FrontModel.api_request_final_get_PageUrl(msg) { Array in
                print(Array)
            }
        }
        
        
        return true
    }
   

    // MARK: UISceneSession Lifecycle


}

