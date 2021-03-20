//
//  ILiveTabbarController.swift
//  ILive_swift
//
//  Created by 王朋 on 2021/3/20.
//

import UIKit

class ILiveTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isTranslucent = false
        let home = ILiveHomeViewController.init()
        self.createTab(vc: home, title:"首页",normal:"icon_tabbar_home_n", select:"icon_tabbar_home_h");
        let Mine = ILiveMineViewController.init()
        self.createTab(vc: Mine, title:"我的",normal:"icon_tabbar_home_n", select:"icon_tabbar_home_h");
        self.viewControllers = [home,Mine]
    }
    
    private func createTab(vc:UIViewController,title:String,normal:String,select:String) {
        let nv = UINavigationController.init(rootViewController: vc)
        vc.title = title
        nv.tabBarItem.title = title
        nv.tabBarItem.image = UIImage.init(named: normal)?.withRenderingMode(.alwaysOriginal)
        nv.tabBarItem.selectedImage = UIImage.init(named: select)?.withRenderingMode(.alwaysOriginal)
        nv.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.red], for: .selected)
        nv.tabBarItem.setTitleTextAttributes([.foregroundColor:UIColor.blue], for: .normal)

    }
    
//    override var shouldAutorotate: Bool {
//        return self.selectedViewController!.shouldAutorotate
//    }
//    
//    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        return self.selectedViewController!.preferredInterfaceOrientationForPresentation
//    }
//    
////    override var prefersStatusBarHidden: Bool {
////        return self.selectedViewController!.prefersStatusBarHidden
////    }
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return self.selectedViewController!.preferredStatusBarStyle
//    }
    
}
