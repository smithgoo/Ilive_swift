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
//                print(Array)
                self.filterWebReq(arr: Array)
            }
        }
        
        
        return true
    }
    
    func filterWebReq(arr:Array<Any>) -> Void {
        let queue = OperationQueue.init()
        //设置最大并发数
        queue.maxConcurrentOperationCount=2
        for tt in arr {
            //创建operation
            let mm:String = tt as! String
            let operation = BlockOperation.init {
                FrontModel.api_reqAction(mm) { msg in
                    
                    FrontModel.api_request_final_get_PageDetail(msg) { model in
                        let modelx:FrontModel = model as! FrontModel
                        print(modelx.nickname)
        
                    }
                    
                }
            }
            //添加到队列中的operation将自动异步执行
            queue.addOperation(operation)
            
        }
 
    }
   

    // MARK: UISceneSession Lifecycle


}

