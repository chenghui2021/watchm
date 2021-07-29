//
//  SettingController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit

//单位
//性别
//年龄
//体重
//目标
//步距

//背光
//灰度
let viewframe = CGRect.init(x: 20, y: ScreenSize.screenHeight-320, width: ScreenSize.screenWidth-40, height: 300)
class SettingController : UIViewController
{
    @IBOutlet weak var grayBtn: UIButton!
    @IBOutlet weak var lightBtn: UIButton!
    
    @IBOutlet weak var unitBtn: UIButton!
    @IBOutlet weak var gender: UIButton!
    @IBOutlet weak var ageBtn: UIButton!
    @IBOutlet weak var weightBtn: UIButton!
    @IBOutlet weak var stepPitch: UIButton!
    @IBOutlet weak var goalStep: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="设置"
       // self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.grayBtn.arrowRightBtn()
        self.lightBtn.arrowRightBtn()
        self.unitBtn.arrowRightBtn()
        self.gender.arrowRightBtn()
        self.ageBtn.arrowRightBtn()
        self.weightBtn.arrowRightBtn() 
        self.stepPitch.arrowRightBtn()
        self.goalStep.arrowRightBtn()
    }
    @IBAction func updataAction(_ sender: Any) {
    }
    @IBAction func selectGrayAction(_ sender: Any) {
        print("灰度ß")
        let graySet = GraySetView(frame: viewframe)
        PopupController.show(graySet)
    }
    
    @IBAction func backLightAction(_ sender: Any) {
    }
    
    @IBAction func unitAction(_ sender: Any) {
    }
    @IBAction func genderAction(_ sender: Any) {
    }
    @IBAction func ageAction(_ sender: Any) {
        let pickerView = MUIPickerView(frame: viewframe)
        PopupController.show(pickerView)

    }
    @IBAction func weightAction(_ sender: Any) {
    }
    
    @IBAction func stepPitchAction(_ sender: Any) {
    }
    
    @IBAction func goalStepAction(_ sender: Any) {
    }
}

class GrayChoiceView: ChoiceView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        
    }
}
