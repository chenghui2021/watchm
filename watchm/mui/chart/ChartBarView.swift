//
//  ChartBarView.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/27.
//

import UIKit
import Foundation
enum CHARTOPT {
    case week
    case month
}

class ChartBarView: UIView {
    
    var chartHeight:CGFloat {
        get{
            return self.frame.size.height-40
        }
    }
    var itemHeight:CGFloat {
        get{
           return chartHeight/5
        }
    }
    var chartWidth:CGFloat{
        get{
            return self.frame.size.width
        }
    }
    
    
    public var goalSteps:Int?

    public var max:Int?
    public var min:Int?
    
    public var monthMark = ["01/01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
    let weekMark = ["星期天","一","二","三","四","五","六"]
    private var markAry:[String]?
    
    public var chartOpt:CHARTOPT = .month
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        markAry = ["100","80","60","40",""]
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        axisX()
        bar()
    }
    
    
    func month(_ start: NSDate, end: NSDate) {
         
    }
    //MARK: 计算最大最小
    func setDataArray() {
        
    }
     
}
extension ChartBarView
{
    func stepup() {
        
    }
    
    //MARK: x 轴线
    func axisX() {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(CGFloat(0.1))
        context?.setFillColor(UIColor.gray.cgColor)
        for item in 1...5 {
            let item_Y=itemHeight*CGFloat(item)
            context?.move(to: CGPoint(x: 10.0, y: item_Y))
            context?.addLine(to: CGPoint(x: chartWidth-50.0, y: item_Y))
            context?.strokePath()
           
                let label = UILabel()
                label.frame = CGRect(x: chartWidth-45.0, y: item_Y-15, width: 50, height: 20)
                label.text = markAry?[item-1]
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 10)
                self.addSubview(label)
                
        }
    }
    
    func axisGoal() {
        
    }
    func bar() {
        if(chartOpt == .week){
            
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = .center
            let itemWidth = (chartWidth-60)/7
            let itemSpace = itemWidth/2
            let barWidth = itemWidth/3
            
            for item in 1...7 {
                let item_frame = CGRect(x: itemSpace+CGFloat((item-1))*itemWidth, y: itemHeight*5, width: barWidth, height: -itemHeight*2)
                let barItem = ItemBar(frame: item_frame)
                self.addSubview(barItem)
                
                let label = UILabel()
                if(item==1){
                    label.frame = CGRect(x: CGFloat((item-1))*itemWidth+itemSpace-(itemWidth/2), y: itemHeight*5+5, width: itemWidth, height: 20)
                }else{
                    label.frame = CGRect(x: CGFloat((item-1))*itemWidth+itemSpace, y: itemHeight*5+5, width: barWidth, height: 20)
                }
                
                label.text = weekMark[item-1]
                label.textColor = .gray
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 12)
                self.addSubview(label)
                 
            }
        }else if(chartOpt == .month) {
            let itemWidth = (chartWidth-60)/31
            let itemSpace = itemWidth/2+8
            let barWidth = itemWidth/2
            for item in 1...31 {
                let item_frame = CGRect(x: itemSpace+CGFloat((item-1))*itemWidth, y: itemHeight*5, width: barWidth, height: -itemHeight*2)
                let barItem = ItemBar(frame: item_frame)
                self.addSubview(barItem)
                //MARK: X坐标
                if(item%6==1){
                    let label = UILabel()
                    label.frame = CGRect(x: CGFloat((item-1))*itemWidth+itemSpace, y: itemHeight*5+5, width: 35, height: 20)
                    
                    label.text = monthMark[item-1]
                    label.textColor = .gray
                    label.textAlignment = .left
                    label.font = UIFont.systemFont(ofSize: 10)
                    self.addSubview(label)
                }
            }
        }
    }
    @objc func cancelItemBar(_ sender: Any){
        let btn:UIButton = sender as! UIButton
        btn.backgroundColor = UIColor.init(red: 117/255.0, green: 126/255.0, blue: 255/255.0, alpha: 1)
    }
    @objc func clickItemBar(_ sender: Any){
        let btn:UIButton = sender as! UIButton
        btn.backgroundColor = UIColor.red
    }
    
    
}

