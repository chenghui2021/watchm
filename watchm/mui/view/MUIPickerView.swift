//
//  MUIPickerView.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/27.
//

import UIKit
import SnapKit
class MUIPickerView:UIView,PopupProtocol
{
    @IBOutlet weak var pickerView: UIPickerView!
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
        contentView = loadXib()
        addSubview(contentView)
        contentView.snp.makeConstraints { (make)->Void in
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.height.equalTo(self)
            make.bottom.equalTo(self)
        }
//        fatalError("init(coder:) has not been implemented")
    }
//    func showInView(){
//            
//        UIApplication.shared.keyWindow?.addSubview(self)
//        
//        UIView.animate(withDuration: 0.3, animations: {
//            self.alpha = 1.0
//            
//        }, completion: nil)
//    }
    
    func loadXib() ->UIView {
            let className = type(of:self)
            let bundle = Bundle(for:className)
            let name = NSStringFromClass(className).components(separatedBy: ".").last
            let nib = UINib(nibName: name!, bundle: bundle)
            let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
            return view
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        PopupController.dismiss(self)
    }
    @IBAction func cancelAction(_ sender: Any) {
        PopupController.dismiss(self)
    }
}

extension MUIPickerView: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           
           return String(row);
       }
       
       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
            
       }
}
