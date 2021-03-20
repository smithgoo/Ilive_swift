//
//  AppDelegate.swift
//  ILive_swift
//
//  Created by 王朋 on 2021/3/12.
//

import UIKit
import MJExtension
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var makeOrientation:UIInterfaceOrientation?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = ILiveTabbarController.init()
 
        return true
    }
    
    open func supportedInterfaceOrientations(for window: UIWindow?) -> UIInterfaceOrientationMask{
        return .allButUpsideDown
       // return self.makeOrientation == UIInterfaceOrientation.landscapeRight ? UIInterfaceOrientationMask.all : UIInterfaceOrientationMask.portrait;
    }
    var blockRotation: UIInterfaceOrientationMask = .portrait{
        didSet{
            if blockRotation.contains(.portrait){
                //强制设置成竖屏
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }else{
                //强制设置成横屏
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                
            }
        }
    }
    
}



//FrontModel.api_reqAction("https://okzy.co/?m=vod-type-id-1.html") { msg in
////           print(msg)
//    FrontModel.api_request_final_get_PageUrl(msg) { Array in
////                print(Array)
//        self.filterWebReq(arr: Array)
//    }
//}

//func filterWebReq(arr:Array<Any>) -> Void {
//    let queue = OperationQueue.init()
//    //设置最大并发数
//    queue.maxConcurrentOperationCount=2
//    for tt in arr {
//        //创建operation
//        let mm:String = tt as! String
//        let operation = BlockOperation.init {
//            FrontModel.api_reqAction(mm) { msg in
//
//                FrontModel.api_request_final_get_PageDetail(msg) { model in
//                    let modelx:FrontModel = model as! FrontModel
//                    print(modelx.mj_keyValues())
//
//                }
//
//            }
//        }
//        //添加到队列中的operation将自动异步执行
//        queue.addOperation(operation)
//
//
//    }
//
//}


