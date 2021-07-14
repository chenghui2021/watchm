//
//  ItemCollect.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit
import SnapKit

class ItemCollection: UICollectionViewCell {
    
    
    let textLabel = UILabel()
    let image = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = Colors.darkGrey.cgColor
        if(DeviceType.isIPhone6P){
            self.layer.borderWidth = 0.2
        }
        else{
            self.layer.borderWidth = 0.25
        }
        image.contentMode = ContentMode.scaleAspectFit
        self.addSubview(image)
        image.snp.makeConstraints({(make)->Void in
            make.width.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        })
        textLabel.font=UIFont.systemFont(ofSize: 14);
        textLabel.textAlignment = NSTextAlignment.center
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints({ (mask)->Void in
            mask.height.equalTo(20)
            mask.left.right.equalToSuperview()
            mask.top.equalTo(image.snp.bottom).offset(5);
            
        })
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
