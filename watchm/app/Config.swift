//
//  Config.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import Foundation
import UIKit

internal class Config {
    static let KEYALARMAPP = "app alarm"
    
    static let sharedInstance = Config()
    var userDefault = UserDefaults.standard
    init() {
        
    }
    //MARK:-ANCS
    func setANCS(flag : UInt16) {
        userDefault.setValue(flag, forKey: "ancs")
    }
    func getANCS() -> UInt16 {
        return UInt16(userDefault.integer(forKey: "ancs"))
    }
    //MARK:-设备绑定记录
    func setBindWatch(name : String) {
        userDefault.setValue(name, forKey: "bindName")
    }
    func getBindWatch() -> String? {
        return userDefault.string(forKey: "bindName") ?? ""
    }
}
