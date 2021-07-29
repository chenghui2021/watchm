//
//  WatchController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//
//检查蓝牙是否可用

import UIKit
class WatchController : UIViewController
{
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var watchBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
     
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        
    }
    @IBAction func actionConnectWithScan(_ sender: Any) {
        //判断是否存在绑定设备 存在需要先解除绑定 然后重新扫描连接
        let connect = storyboard?.instantiateViewController(withIdentifier : "connectController") as! ConnectController
        PopupController.show(connect)
    }
}
