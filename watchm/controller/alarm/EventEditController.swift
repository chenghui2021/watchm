//
//  EventEditController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/23.
//

import UIKit

class EventEditController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var contentText: UITextField!
    @IBOutlet weak var dateTimeText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBAction func createAction(_ sender: Any) {
        //PopupController.dismiss(self)
    }
    @IBAction func cancelAction(_ sender: Any) {
       // PopupController.dismiss(self)
    }
}
