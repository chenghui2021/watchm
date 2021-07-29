//
//  AboutController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import UIKit

class AboutController: UIViewController {
    @IBOutlet weak var versionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    @IBAction func actionPrivocy(_ sender: Any) {
    }
    @IBAction func actionHelp(_ sender: Any) {
    }
}
