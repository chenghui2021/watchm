//
//  ConnectController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import UIKit
import CoreBluetooth
class ConnectController:UIViewController,PopupProtocol
{
    @IBOutlet weak var watchTable: UITableView!
    private var devicesArray = [MZPeripheral]()
    var deviceNames = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
       // watchTable.tableFooterView=scanButton()
        //注册cell
        self.watchTable.register(UITableViewCell.self, forCellReuseIdentifier: "watchCell")
        setupBLE()
        scanStart()
         
    }
    
    func scanStart() {
        MZBLE.scan()
    }
    func scanStop() {
        MZBLE.stopScan()
    }
    //MARK: - setupble
    func setupBLE()  {
        MZBLE.isLogEnabled = true
        //MZBLE.addChannel(delegate: self)
        MZBLE.blockOnNewPeripheral { (peripheral, advertisementData, rssi) in
            let name = peripheral.name ?? "nil name"
            //print("发现新设备 \(name) advertisementData \(advertisementData) rssi \(rssi)")
            if(name.hasPrefix("Watch M")){
                //属于我们的特定设备
                if self.deviceNames.contains(where: { $0.caseInsensitiveCompare(name) == .orderedSame }) {
                }else{
                    self.deviceNames.append(name)
                    let device = MZPeripheral(peripheral, advertisementData, rssi)
                    self.devicesArray.append(device)
                    //DispatchQueue.main.sync {
                        self.watchTable.beginUpdates()
                        self.watchTable.insertRows(at: [IndexPath.init(row:  self.deviceNames.count-1, section: 0)], with: UITableView.RowAnimation.none)
                        self.watchTable.endUpdates()
                    //}
                }
            }
        }
        
        //监听已就绪
        MZBLE.blockOnPeripheralReady { (peripheral) in
            let peripherlName = peripheral.name ?? "nil name"
            print("已就绪 \(peripherlName)")
//            MZBLE.sendData(peripheral: peripheral, data: <#T##Data#>, serviceUUID: <#T##String?#>, writeUUID: <#T##String?#>, type: <#T##CBCharacteristicWriteType?#>, completionHandler: <#T##MZSendDataCompletionHandler?##MZSendDataCompletionHandler?##(MZPeripheral?, Data, MZError?) -> Void#>)
            
        }
    }
    
    
    
    @IBAction func actionClose(_ sender: Any) {
        scanStop()
        PopupController.dismiss(self)
    }
    func scanButton() -> UIButton {
        let scanBtn:UIButton = UIButton.init(type: UIButton.ButtonType.custom);//新建btn
        scanBtn.frame = CGRect.init(x: 0, y: 0, width: watchTable.bounds.width, height: 50);//frame位置和大小
        //cancelBtn.backgroundColor = UIColor.white;//背景色
              // btn.imageView?.image = UIImage.init(named: "aaa")//设置图片
        //cancelBtn.layer.cornerRadius = 10
        //cancelBtn.layer.masksToBounds = true //设置圆角
        scanBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        scanBtn.setTitle("重新扫描", for:  UIControl.State.normal)//设置标题
        scanBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)//设置字体大小
               //self.view.addSubview(btn);
               //没有有参数
       //        btn.addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside);
        scanBtn.addTarget(self, action:#selector(tapped(_:)), for:UIControl.Event.touchUpInside)
        return scanBtn
    }
    @objc func tapped(_ btn:UIButton){
       
        //PopupController.dismiss(self)
    }
    
}
//MARK: - BLE
extension ConnectController: BLEDelegate
{
    func tag() -> String {
        return "ConnectController"
    }
    //手表连接状态监听
    func bluetoothPeripheralStateChange(peripheral: CBPeripheral, state: peripheralStatus) {
        
    }
    //手机系统蓝牙状态改变
    func bluetoothCentralManagerDidUpdateState(states: CBManagerState) {
       
    }
    //收到此回调后代表该peripheral可以发送数据
    func bluetoothPeripheralReady(peripheral: CBPeripheral) {
        print("\(peripheral.name ?? "没有名字")已经就绪，可以发送数据")
        
        
    }
    //收到的数据在此处理
    func bluetoothPeripheral(_ peripheral: CBPeripheral, didReadData data: Data){
        print("收到数据 \(data.toString())")
    }
    
}
//MARK: -UITableView
extension ConnectController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devicesArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(66.0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "watchCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        let name:String = deviceNames[indexPath.row]
        cell?.textLabel?.text = name
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select\(indexPath.row)")
        MZBLE.stopScan()//停止扫描
        let device = devicesArray[indexPath.row]
        MZBLE.connect(mzPeripheral: device)
    }
     
    
}
