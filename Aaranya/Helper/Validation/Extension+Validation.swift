//
//  Extension+Validation.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 05/02/21.
//

import Foundation
import  UIKit
extension UIViewController{
    
//MARK:- CurrentDate
func currentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        return result
    }
   
    
    
func convert24HTo12H(timeIn24H: String) -> String{
//    let timeIn24H = "14:15"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"

    let date = dateFormatter.date(from: timeIn24H)
    dateFormatter.dateFormat = "h:mm a"
    let Date12 = dateFormatter.string(from: date!)
    return Date12
    
    //print(convert24HTo12H(timeIn24H: "18:36"))
}
    
    
    
 
    func convert12HTo24H(timeIn12H: String) -> String{
    //let dateAsString = "1:15 PM"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h:mm a"

    let date = dateFormatter.date(from: timeIn12H)
    dateFormatter.dateFormat = "HH:mm"
    let Date24 = dateFormatter.string(from: date!)
    return Date24
    
  //print(convert12HTo24H(timeIn24H: "6:36 PM"))
        
}

}

extension String{
    
    //MARK:- ValidationForPhoneNumber
    var isValidPhoneNumber: Bool{
        
        do{
            
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            
            if let res =  matches.first{
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
            }else{
                
                return false
            }
            
        }catch{
            
            
            return false
        }
        
    }
    
    //MARK:- Validation For Email
    var isValidEmail: Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailText  = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailText.evaluate(with: self)
    }
    
    //MARK:- Validation For Password
    var isValidPassword: Bool{
        
        let testPassword = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z\\d$@$#!%*?&]{8,}")
        //for letter (?=.*[a-zA-Z])
        //for special character (?=.*[$@$#!%*?&])
        return testPassword.evaluate(with: self)
    }
    
    
}

