//
//  UserDetailResponseModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 05/02/21.
//

import Foundation
import SwiftyJSON

class UserDetailResponseModel: Codable {
    
        var status: Bool
        var message: String = ""
       
        
        init(json: JSON){
            
            status = json["status"].boolValue
            message = json["message"].stringValue
           
            
        }
            
        
        
    }


