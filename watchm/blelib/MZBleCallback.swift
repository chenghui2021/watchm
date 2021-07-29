//
//  MZBleCallback.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/22.
//

import Foundation
import CoreBluetooth

@objc enum peripheralStatus:Int {
    case connnetSuccesed = 0
    case connnetFaild = 1
    case disConnnet = 2
}

enum MZHandlerResult {
    case success
    case failure(MZError)
}

//MARK: - delegate
@objc protocol BLEDelegate:NSObjectProtocol {
    // 用来区分不同的代理 ，通常用当前类的类名代替
    func tag() -> String;
    
    //MARK:  常用方法
    
    /// 状态变更
    /// - Parameter peripheral: 当前状态变更的设备
    /// - Parameter status: 变更的状态
    @objc optional func bluetoothPeripheralStateChange(peripheral:CBPeripheral,state:peripheralStatus);
    
    
    /// 发现新外设
    /// - Parameter peripheral: 蓝牙外设
    /// - Parameter RSSI: 蓝牙外设信号强度
    /// - Parameter advertisementData: 蓝牙外设广播附带数据
    /// 有时候外设修改名字后因为缓存原因 peripheral.name不会变动，此时可以用advertisementData[CBAdvertisementDataLocalNameKey]来区分设备
    @objc optional func bluetoothNewPeripheral(peripheral:CBPeripheral,advertisementData:[String : Any],RSSI:NSNumber)
        
    /// 外设已经就绪，可以向外设发送指令
    /// - Parameter peripheral: 蓝牙外设
    @objc optional func bluetoothPeripheralReady(peripheral:CBPeripheral)
    
    
    /// 蓝牙外设收到的数据
    /// - Parameter data: 收到的数据
    @objc optional func bluetoothPeripheral(_ peripheral: CBPeripheral, didReadData data: Data)
    
    //MARK:  详细方法
    
    @objc optional func bluetoothCentralManagerDidUpdateState(states: CBManagerState)

}

//MARK: - block

//筛选设备 当 发现或 连接的时候
typealias MZFilterPeripheralHandler = (_ peripheral: MZPeripheral) -> Bool

//连接设备回调
typealias MZConnectPeripheralCompletionHandler = (_ peripheral: MZPeripheral?, _ result: MZHandlerResult) -> Void

//扫描设备进度回调
typealias MZScanProgressHandler = (_ newPeripheral: MZPeripheral,  _ discoveryedPeripherals: [MZPeripheral]) -> Void

//扫描设备完成回调
typealias MZScanCompletionHandler = (_ discoveryedPeripherals: [MZPeripheral]?, _ error: MZError?) -> Void

//发送数据后回调
typealias MZSendDataCompletionHandler = (_ peripheral: MZPeripheral?, _ data: Data, _ error: MZError?) -> Void

//订阅设备结束回调
typealias MZNotifyCharacteristicCompletionHandler = (_ peripheral: MZPeripheral?, _ characteristic: CBCharacteristic?, _ result: MZHandlerResult) -> Void

//MARK:  常用方法

/// 状态变更
/// - Parameter peripheral: 当前状态变更的设备
/// - Parameter status: 变更的状态
typealias MZPeripheralStateChangeBlock = (_ peripheral: CBPeripheral,_ state:peripheralStatus) -> Void

/// 发现新外设
/// - Parameter peripheral: 蓝牙外设
/// - Parameter RSSI: 蓝牙外设信号强度
/// - Parameter localName:  蓝牙外设广播附带数据
/// 有时候外设修改名字后因为缓存原因 peripheral.name不会变动，此时可以用advertisementData["kCBAdvDataLocalName"]来区分设备
typealias MZNewPeripheralBlock = (_ peripheral: CBPeripheral,_ advertisementData:[String : Any], _ RSSI:NSNumber) -> Void

/// 外设已经就绪，可以向外设发送指令
/// - Parameter peripheral: 蓝牙外设
typealias MZPeripheralReadyBlock = (_ peripheral: CBPeripheral) -> Void

/// 蓝牙外设收到的数据
/// - Parameter data: 收到的数据
typealias MZbluetoothReadDataBlock = (_ peripheral: CBPeripheral,_ data: Data) -> Void
class MZBlock: NSObject {
    // 用来区分不同的代理 ，通常用当前类的类名代替
    public typealias MZTagBlock = () -> String

    //蓝牙外设状态改变
    var blockOnPeripheralStateChange: MZPeripheralStateChangeBlock?
    //发现新外设
    var blockOnNewPeripheral: MZNewPeripheralBlock?
    //新外设已就绪，可以发送数据
    var blockOnPeripheralReady: MZPeripheralReadyBlock?
    //蓝牙外设收到的数据
    var blockOnBluetoothReadData: MZbluetoothReadDataBlock?
}
