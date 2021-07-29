//
//  MZCiphers.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/22.
//  通讯密码

import Foundation

struct WordDateTime {
    var dateTime:NSDate!
    var timeZone:UInt8!
    var dst:UInt8!
    var city:String!
    var year: UInt8!
    var month: UInt8!
    var day: UInt8!
    var hour: UInt8!
    var min: UInt8!
    var sec: UInt8!
    var checkSum:UInt8!
    init() {
        self.dateTime = NSDate()
        self.timeZone = 8
        self.dst = 0
        self.city = "HKG"
        self.year = UInt8(NSCalendar.current.component(.year, from: dateTime as Date) % 100).toTime()
        self.month = UInt8(NSCalendar.current.component(.month, from: dateTime as Date)).toTime()
        self.day = UInt8(NSCalendar.current.component(.day, from: dateTime as Date)).toTime()
        self.hour = UInt8(NSCalendar.current.component(.hour, from: dateTime as Date)).toTime()
        self.min = UInt8(NSCalendar.current.component(.minute, from: dateTime as Date)).toTime()
        self.sec = UInt8(NSCalendar.current.component(.second, from: dateTime as Date)).toTime()
        
        self.checkSum = 0//self.year+self.month+self.day+self.hour+self.min+self.sec+self.timeZone
        
    }
    
    init(dateTime:NSDate, timeZone:UInt8, dst:UInt8) {
        self.dateTime = dateTime
        self.timeZone = timeZone
        self.dst = dst
        self.city = "HKG"
        self.year = UInt8(NSCalendar.current.component(.year, from: dateTime as Date)) % 100
        self.month = UInt8(NSCalendar.current.component(.month, from: dateTime as Date))
        self.day = UInt8(NSCalendar.current.component(.day, from: dateTime as Date))
        self.hour = UInt8(NSCalendar.current.component(.hour, from: dateTime as Date))
        self.min = UInt8(NSCalendar.current.component(.minute, from: dateTime as Date))
        self.sec = UInt8(NSCalendar.current.component(.second, from: dateTime as Date))
    }
    
}

class MZCiphers: NSObject {
    //MARK: -指令
    public static func ACK() -> Data {
        return Data([0x01,0xaa,0xab])
    }
    //回复失败指令
    public static func ackError() -> Data {
        return Data([0x01,0x55,0x56])
        
    }
    
    public static func wordDateTime(dateTime:WordDateTime) -> Data {
        var data = Data()
        data.append(0x24)
        data.append(14)
        data.append(5)
        data.append(dateTime.year/100)
        data.append(dateTime.year%100)
        data.append(dateTime.month)
        data.append(dateTime.day)
        data.append(dateTime.hour)
        data.append(dateTime.min)
        data.append(dateTime.sec)
        data.append(dateTime.timeZone)
        data.append(dateTime.dst)
        data.append(0x00)
        data.append(0x00)
        data.append(0x00)
        data.append(dateTime.checkSum)
        data.append(0x00)
        data.append(0x00)
        data.append(0x00)
        data.append(0x00)
        return data
    }
    
    public static func ancs(p: UInt16) -> Data {
        let a,c: UInt8!
        a = UInt8((p>>8) & 0xf)
        c = UInt8(p & 0xf)
        let check = 4 + 10 + a + c
        return Data([0x24,0x04,0x0a,a,c,check,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
    }
    
    
    
}







