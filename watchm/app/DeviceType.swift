//
//  DeviceType.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit

public struct DeviceType
{
    /// The user interface should be designed for iPhone and iPod touch.
    static let isPhone = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    /// The user interface should be designed for iPad.
    //static let isPad = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    /// The user interface should be designed for Apple TV.
    //static let isAppleTV = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.tv
    /// IPhone4
    static let isIPhone4 = isPhone && ScreenSize.screenMaxLength == 480.0
    /// IPhone5
    static let isIPhone5 = isPhone && ScreenSize.screenMaxLength == 568.0
    /// IPhone6
    static let isIPhone6 = isPhone && ScreenSize.screenMaxLength == 667.0
    /// IPhone6P
    static let isIPhone6P = isPhone && ScreenSize.screenMaxLength == 736.0
    
    
}
