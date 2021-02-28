//
//  ProfileResponseModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 09/02/21.
//

import Foundation
import SwiftyJSON

struct ProfileResponseModel {
    var first_name: String = ""
    var last_name: String = ""
    var mobile: String = ""
    var location: String = ""
    var employee_id: String = ""
    
    init() {
        
    }
    
    init(json: JSON){
        
        first_name = json["first_name"].stringValue
        last_name = json["last_name"].stringValue
        mobile = json["mobile"].stringValue
        location = json["location"].stringValue
        employee_id = json["employee_id"].stringValue
    }
    
    
}
