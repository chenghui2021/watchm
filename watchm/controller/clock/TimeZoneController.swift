//
//  TimeZoneController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/21.
//

import UIKit

class TimeZoneController: UIViewController,PopupProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func closeAction(_ sender: Any) {
        PopupController.dismiss(self)
    }
}
extension TimeZoneController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "cityCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
         
        cell?.textLabel?.text = "City"
//        cell?.detailTextLabel?.text = "-UUID"
        //cell?.imageView?.image = UIImage(named:"Expense_success")
        return cell!
    }
    
    
    
}
