//
//  SyncTimeController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import UIKit

class SyncTimeController: UIViewController {
    
    @IBOutlet weak var timeZoneBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.timeZoneBtn.arrowRightBtn()
    }
    @IBAction func timeZoneChoose(_ sender: Any) {
        let timeZone = storyboard?.instantiateViewController(withIdentifier : "timeZoneController") as! TimeZoneController
        PopupController.show(timeZone)
        //self.navigationController?.pushViewController(timeZone, animated: false)
    }
}
