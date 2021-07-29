//
//  MUINavigationController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/23.
//

import UIKit

class MUINavigationController: UINavigationController,UINavigationControllerDelegate {
    
   
    private var backBar:UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setNavigationBarHidden(true, animated: false)
        self.navigationBar.shadowImage = imageNavShadow
        self.navigationBar.isTranslucent = true
        self.navigationBar.setBackgroundImage(imageNavBar, for: .default)
        let backBtn = UIButton(type: UIButton.ButtonType.custom)
        backBtn.bounds = CGRect(x: 0,y: 0,width: 40,height: 40)
        backBtn.setImage(UIImage(named: "back.png"), for: .normal)
        backBtn.imageView?.contentMode = .center
        backBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        backBtn.addTarget(self, action: #selector(popTopre(_:)), for: .touchUpInside) 
        self.backBar = UIBarButtonItem(customView: backBtn)
       
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if(self.viewControllers.count >= 1){
            self.setNavigationBarHidden(false, animated: false)
            self.navigationBar.setBackgroundImage(UIImage.init(named: "navback_daytime.png"), for: .default)
            viewController.navigationItem.leftBarButtonItem=self.backBar
            
            
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func popTopre(_ btn:UIButton) {
         
        self.popViewController(animated: true)
    }
}
