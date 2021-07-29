//
//  ItemBar.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/28.
//

import UIKit

class ItemBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.init(red: 138/255.0, green: 43.0/255.0, blue: 226/255.0, alpha: 1)
        self.layer.cornerRadius = 2
        self.layer.masksToBounds = true //设置圆角
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
