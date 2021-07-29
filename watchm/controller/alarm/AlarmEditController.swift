//
//  AlarmEditController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/23.
//

import UIKit
let weekframe = CGRect.init(x: 20, y: ScreenSize.screenHeight-490, width: ScreenSize.screenWidth-40, height: 470)
class AlarmEditController: UIViewController {
    @IBOutlet weak var weekBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weekBtn.arrowRightBtn()
    }
    @IBAction func saveAction(_ sender: Any) {
        //PopupController.dismiss(self)
    }
    
    @IBAction func weekCheckAction(_ sender: Any) {
        let weekChoiceView = WeekChoiceView(frame: weekframe)
        PopupController.show(weekChoiceView)
    }
    
}
