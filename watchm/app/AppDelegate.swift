//
//  AppDelegate.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit
import CoreBluetooth
@main
class AppDelegate: UIResponder, UIApplicationDelegate,BLEDelegate {
    func tag() -> String {
        return "MainApp"
    }
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        MZBLE.addChannel(delegate: self)
        window = UIWindow(frame: UIScreen.main.bounds)
        if let keyWindow = window {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let viewController = storyboard.instantiateViewController(withIdentifier: "homeController") as? HomeController
                else {return false}
            let navigationController = MUINavigationController(rootViewController: viewController)
            navigationController.navigationBar.isTranslucent=true
            viewController.modalPresentationStyle = .formSheet
            
            if #available(iOS 13.0, *) {
                viewController.isModalInPresentation = true
            } else {
                // Fallback on earlier versions
            }
            keyWindow.rootViewController = navigationController
            keyWindow.makeKeyAndVisible()
        }
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
         
    }
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("进入后台")
    }
    func applicationWillTerminate(_ application: UIApplication) {
       // print("将要退出结束")
    }
    
    //手表连接状态监听
    func bluetoothPeripheralStateChange(peripheral: CBPeripheral, state: peripheralStatus) {
                switch state {
                case .connnetSuccesed:
                    print("APP连接成功")
                case .connnetFaild:
                    print("APP连接失败")
                case .disConnnet:
                    print("APP断开链接")
                default:break
                }
    }
    //手机系统蓝牙状态改变
    func bluetoothCentralManagerDidUpdateState(states: CBManagerState) {
       
    }
    //收到的数据在此处理
    func bluetoothPeripheral(_ peripheral: CBPeripheral, didReadData data: Data){
        print("收到数据 \(data.toString())")
    }
    
}

