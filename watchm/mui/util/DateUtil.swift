//
//  DateUtil.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/28.
//

import Foundation

class DateUtil {
    //MARK:计算指定月天数
    public static func getDaysInMonth(_ year: Int,_ month: Int) -> Int
    {
        let calendar = Calendar.current//NSCalendar.current
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        var endComps = DateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? year + 1 : year
        let diff = calendar.dateComponents([.day], from: startComps , to: endComps )
        return diff.day ?? 30
    }
}

extension NSDate{
    
}
