//
//  WeekChoiceView.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/28.
//

import UIKit

class WeekChoiceView: UIView,PopupProtocol {
    @IBOutlet weak var sundayBtn: UIButton!
    
    @IBOutlet weak var mondayBtn: UIButton!
    @IBOutlet weak var tuesdayBtn: UIButton!
    
    @IBOutlet weak var wednesdayBtn: UIButton!
    
    @IBOutlet weak var thursdayBtn: UIButton!
    @IBOutlet weak var fridayBtn: UIButton!
    @IBOutlet weak var saturdayBtn: UIButton!
    
     
    @IBAction func checkWeekChange(_ sender: Any) {
    }
    @IBAction func cancelAction(_ sender: Any) {
        PopupController.dismiss(self)
    }
    override func layoutSubviews() {
           super.layoutSubviews()
           
    }
       
    var contentView:UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = loadXib()
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.gray.cgColor
        addSubview(contentView)
        contentView.snp.makeConstraints { (make)->Void in
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    func loadXib() -> UIView {
            let className = type(of:self)
            let bundle = Bundle(for:className)
            let name = NSStringFromClass(className).components(separatedBy: ".").last
            let nib = UINib(nibName: name!, bundle: bundle)
            let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
            return view
    }
    
}
