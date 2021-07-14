//
//  ScreenSize.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit

public struct ScreenSize {
    /// 屏幕宽
        static let screenWidth = UIScreen.main.bounds.size.width
        /// 屏幕高
        static let screenHeight = UIScreen.main.bounds.size.height
        /// 屏幕最大长度
        static let screenMaxLength = max(ScreenSize.screenWidth, ScreenSize.screenHeight)
        /// 屏幕最小长度
        static let screenMinLength = min(ScreenSize.screenWidth, ScreenSize.screenHeight)
}
