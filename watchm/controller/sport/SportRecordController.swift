//
//  SportRecodeController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import UIKit

class SportRecordController: UIViewController {
    
    
    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let barChart = ChartBarView(frame: CGRect(x: 10, y: 10, width: ScreenSize.screenWidth-20, height: self.chartView.frame.size.height-20))
        self.chartView.addSubview(barChart)
        
    }
    
    @IBAction func downDateAction(_ sender: Any) {
    }
    
    @IBAction func upDateAction(_ sender: Any) {
    }
}
