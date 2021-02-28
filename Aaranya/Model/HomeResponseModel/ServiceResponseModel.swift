//
//  HomeResponseModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 08/02/21.
//

import Foundation
import SwiftyJSON
struct ServiceResponseModel {
    
    
    var  title: String = ""
    var icon: String = ""
    
    init() {
        
    }
    
    
    init(json:JSON ) {
        title = json["title"].stringValue
        icon = json["icon"].stringValue
    }
     
}

//MARK:- OngoingSessionResponseModel
struct OngoingSessionResponseModel {
    
    
    var  logo_image: String = ""
    var  first_name: String = ""
    var  last_name: String = ""
    var  name: String = ""
    var enrolled: String = ""
    var meeting_name: String = ""
    var time: String = ""
    var end: String = ""
    var  mtype: String = ""
    var  schedule_id: String = ""
    var  date: String = ""
    var  id: String = ""
    
    init() {
        
    }
    
    
    init(json:JSON ) {
        logo_image = json["logo_image"].stringValue
        first_name = json["first_name"].stringValue
        last_name = json["last_name"].stringValue
        name = json["name"].stringValue
        enrolled = json["enrolled"].stringValue
        time = json["time"].stringValue
        end = json["end"].stringValue
        mtype = json["mtype"].stringValue
        
        schedule_id = json["schedule_id"].stringValue
        date = json["date"].stringValue
        id = json["id"].stringValue
    }
     
}

struct TodayScheduleResponseModel {
    
    
    var  logo_image: String = ""
    var  first_name: String = ""
    var  last_name: String = ""
    var  service: String = ""
    var  mtype: String = ""
    var  schedule_id: String = ""
    var  date: String = ""
    
    
    init() {
        
    }
    
    
    init(json:JSON ) {
        logo_image = json["logo_image"].stringValue
        first_name = json["first_name"].stringValue
        last_name = json["last_name"].stringValue
        service = json["name"].stringValue
        mtype = json["mtype"].stringValue
        
        schedule_id = json["schedule_id"].stringValue
        date = json["date"].stringValue
        
       
       
    }
     
}
//MARK:- EnrolledSessionResponseModel
struct EnrolledSessionResponseModel {
    
    
    var  logo_image: String = ""
    var  first_name: String = ""
    var  last_name: String = ""
    var  service: String = ""
    var  time: String = ""
    var is_enrolled: String = ""
    var name: String = ""
    var enrolled: String = ""
    var meeting_name: String = ""
    var mtype: String = ""
    
    init() {
        
    }
    
    
    init(json:JSON ) {
        logo_image = json["logo_image"].stringValue
        first_name = json["first_name"].stringValue
        last_name = json["last_name"].stringValue
        service = json["service"].stringValue
        name = json["name"].stringValue
        mtype = json["mtype"].stringValue
        time = json["time"].stringValue
        enrolled = json["enrolled"].stringValue
        meeting_name = json["meeting_name"].stringValue
       
    }
     
}


//MARK:- KnowYourHealerResponseModel
struct YourHealerResponseModel {
    
    var  logo_image: String = ""
    var  first_name: String = ""
    var  last_name: String = ""
    var  service: String = ""
    
    
    init() {
        
    }
    
    
    init(json:JSON ) {
        logo_image = json["logo_image"].stringValue
        first_name = json["first_name"].stringValue
        last_name = json["last_name"].stringValue
        service = json["name"].stringValue
       
       
    }
     
}



