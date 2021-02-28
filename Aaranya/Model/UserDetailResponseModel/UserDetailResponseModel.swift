
import Foundation
import SwiftyJSON
struct UserDetailResponseModel : Codable {
    var email: String = ""
    var otp: String = ""
        
    init() {
        
        }
        
        init(json: JSON){
            
            email = json["email"].stringValue
            otp = json["otp"].stringValue
        }
        
    }








