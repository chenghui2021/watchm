//
//  MUIScrollView.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//  滚动出steps

import UIKit

class PullScrollView: UIScrollView
{
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension PullScrollView : UIScrollViewDelegate
{
    
    
}
