//
//  ScheduleResponseModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 09/02/21.
//

import Foundation
import SwiftyJSON

struct HealerResponseModel {
    
        var  logo_image: String = ""
        var  first_name: String = ""
        var  last_name: String = ""
        var  service: String = ""
        var benifit: String = ""
    
        init() {
            
        }
        
        
        init(json:JSON ) {
            logo_image = json["logo_image"].stringValue
            first_name = json["first_name"].stringValue
            last_name = json["last_name"].stringValue
            service = json["name"].stringValue
            benifit = json["benifit"].stringValue
           
        }
         
    }


//MARK:- Availabel Schedule
struct AvailableScheduleResponseModel {
    
        var  time: String = ""
        var  end: String = ""
        var  first_name: String = ""
        var  last_name: String = ""
         var  status: String = ""
         var id: String = ""
        
        init() {
            
        }
        
        
        init(json:JSON ) {
           
            time = json["time"].stringValue
            end = json["end"].stringValue
            first_name = json["first_name"].stringValue
            last_name = json["last_name"].stringValue
            status = json["status"].stringValue
            id = json["id"].stringValue
            
           
        }
         
    }





