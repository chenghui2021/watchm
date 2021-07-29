//  MZ 茂智科技
//  MZError.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/22.
//

import Foundation
public enum MZError : Error
{
    //MARK: - 蓝牙权限 异常
    //没有蓝牙权限
    case failedScanUnauthorized
    
    //蓝牙没有启动
    case failedScanPoweredOff
    
    //iPhone(iPad,iWatch,Mac)不支持蓝牙
    case failedScanUnsupported
    
    
    //MARK: - 扫描 异常
    //扫描设备超时
    case failedScanTimeout
    
    
    //MARK: - 连接 异常
    // 不符合外设筛选条件
    case failedConnectFailedFilter
    
    // 系统返回的连接失败error
    case failedConnect(Error?)

    
    //连接设备超时 适当调整connect时间或确定信号强度
    case failedConnectTimeout
    
    //设备未连接
    case notConnectPeripheral
    
    //特征值无效
    case invalidCharacteristic
    
}

