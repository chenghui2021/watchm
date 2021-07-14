//
//  EventModel.swift
//  watchm
//
//  Created by Mos Dev Mac on 2021/7/14.
//

import Foundation

struct EventModel {
    var title:String?
    var date:String?
    var time:String?
    var content:String?
    
    init(title:String,date:String,time:String,content:String){
        self.title=title
        self.date=date
        self.time=time
        self.content=content
    }
}
