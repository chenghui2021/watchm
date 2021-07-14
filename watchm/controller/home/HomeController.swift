//
//  ViewController.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/13.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var mNavBackground: UIImageView!
    @IBOutlet weak var funView: UICollectionView!
    
    let titleAry = ["App提醒", "手机提醒", "运动","事件提醒","邮件提醒","蓝牙校时","设置","拍照","闹铃","帮助","查找","我的"]
    let imageAry = [UIImage.init(named: "message.png"),UIImage.init(named: "phone.png"),UIImage.init(named: "sport.png"),UIImage.init(named: "plan.png"),UIImage.init(named: "mail.png"),UIImage.init(named: "clock.png"),UIImage.init(named: "setting.png"),UIImage.init(named: "camera.png"),UIImage.init(named: "alarm.png"),UIImage.init(named: "help.png"),UIImage.init(named: "find_watch.png"),UIImage.init(named: "me.png")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        funView.register(ItemCollection.self, forCellWithReuseIdentifier: "itemview")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
// Mark: Data
extension HomeController: UICollectionViewDataSource,UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemview", for: indexPath) as! ItemCollection
        cell.textLabel.text=titleAry[indexPath.row]
        cell.image.image = imageAry[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         
        switch indexPath.row {
        case 0:
            let app = storyboard?.instantiateViewController(withIdentifier : "appController") as! AppController
            self.navigationController?.pushViewController(app, animated: false)
            break
        case 1:
            let phone = storyboard?.instantiateViewController(withIdentifier : "phoneController") as! PhoneController
            self.navigationController?.pushViewController(phone, animated: false)
            break
        case 2:
        break
        case 3:
            let event = storyboard?.instantiateViewController(withIdentifier : "eventController") as! EventController
            self.navigationController?.pushViewController(event, animated: false)
            break
        case 4:
            let email = storyboard?.instantiateViewController(withIdentifier : "emailController") as! EmailController
            self.navigationController?.pushViewController(email, animated: false)
            break
        case 5:
            let syncTime = storyboard?.instantiateViewController(withIdentifier : "syncTimeController") as! SyncTimeController
            self.navigationController?.pushViewController(syncTime, animated: false)
            break
        case 6:
            let setting = storyboard?.instantiateViewController(withIdentifier : "settingController") as! SettingController
            self.navigationController?.pushViewController(setting, animated: false)
        break
        case 7:
            //拍照
            break
        case 8:
            let alarm = storyboard?.instantiateViewController(withIdentifier : "alarmController") as! AlarmController
            self.navigationController?.pushViewController(alarm, animated: false)
            break
        case 9:
            let about = storyboard?.instantiateViewController(withIdentifier : "aboutController") as! AboutController
            self.navigationController?.pushViewController(about, animated: false)
            break
        case 10:
            //查找
            
            break
        case 11:
            let watch = storyboard?.instantiateViewController(withIdentifier : "watchController") as! WatchController
            self.navigationController?.pushViewController(watch, animated: false)
            break
        default:
            break
        }
    }
}

