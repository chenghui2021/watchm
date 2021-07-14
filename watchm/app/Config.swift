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
    func set(onoff : Bool) {
        userDefault.setValue(onoff, forKey: "onoff")
    }
}
