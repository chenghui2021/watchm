//
//  MUIButton.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/23.
//

import UIKit

extension UIButton {
    
    func arrowRightBtn() {
       // self.setImage(UIImage(named: "right_arrow_button.png"), for: .normal)
        let imageSize = self.imageView?.frame.size
        let width = self.frame.size.width
        self.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: -width)
        self.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -(imageSize?.width ?? 0)*2, bottom: 0, right: 0)
        self.imageView?.contentMode = .scaleAspectFit
        self.contentHorizontalAlignment = .right
        self.titleLabel?.textAlignment = .left
//        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        
    }
}
