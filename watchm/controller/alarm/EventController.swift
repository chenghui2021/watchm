//
//  EventController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import UIKit

class EventController: UIViewController {
    @IBOutlet weak var eventTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.eventTable.register(UITableViewCell.self, forCellReuseIdentifier: "eventCell")
    }
    @IBAction func addEventAction(_ sender: Any) {
        let eventEdit = storyboard?.instantiateViewController(withIdentifier : "eventEditController") as! EventEditController
        self.navigationController?.pushViewController(eventEdit, animated: true)
        //PopupController.show(eventEdit)
    }
}
extension EventController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70.0)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "eventCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
         
        cell?.textLabel?.text = "Title"
        return cell!
    }
    
    
}
