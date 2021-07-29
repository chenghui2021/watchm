//
//  MUIImage.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/26.
//

import UIKit
let imageNavShadow = UIImageUtil.imageFromColor(color: UIColor.clear, viewSize: CGSize.init(width: ScreenSize.screenWidth, height: 1))
let imageNavBar = UIImageUtil.imageFromColor(color: UIColor.clear, viewSize: CGSize.init(width: ScreenSize.screenWidth, height: 30))
class UIImageUtil: NSObject
{ 
    public static func imageFromColor(color: UIColor, viewSize: CGSize) -> UIImage{

           let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)

           UIGraphicsBeginImageContext(rect.size)

           let context: CGContext = UIGraphicsGetCurrentContext()!

           context.setFillColor(color.cgColor)

           context.fill(rect)
 
           let image = UIGraphicsGetImageFromCurrentImageContext()

           UIGraphicsGetCurrentContext()

           return image!

       }
}
