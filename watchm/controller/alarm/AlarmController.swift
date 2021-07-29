//
//  AlarmController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import UIKit
//闹铃
class AlarmController:UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = Colors.green
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
     
    @IBAction func actionEditAlarm1(_ sender: Any) {
        print("alarm1")
        let alarmEdit = storyboard?.instantiateViewController(withIdentifier : "alarmEditController") as! AlarmEditController
        //PopupController.show(alarmEdit)
        self.navigationController?.pushViewController(alarmEdit, animated: true)
    }
    
    @IBAction func actionEditAlarm2(_ sender: Any) {
    }
    @IBAction func actionEditAlarm3(_ sender: Any) {
    }
}
