//
//  UserDetailViewModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 05/02/21.
//

import Foundation
import UIKit
extension UserDetailViewController{
    
    //MARK:-document directory realted method
    public func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    public func saveImageDocumentDirectory(usedImage:UIImage, nameStr:String) {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(nameStr)
        let imageData = usedImage.jpegData(compressionQuality: 0.7)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }

    func userDetailWithImage()  {
        
    
    if textFirstName.text == "" {
        showOkAlert(message: "Please enter First Name.")
    }else if textLastName.text == ""{
        showOkAlert(message: "Please enter Last Name.")
    }else if textOrganizasionName.text == ""{
        showOkAlert(message: "Please enter Organization Code.")
    }else if textEmployeeID.text == ""{
        
        showOkAlert(message: "Please enter Employee ID.")
    }else if textDepartmentName.text == ""{
        showOkAlert(message: "Please enter Department Name.")
        
    }else if textGender.text == ""{
        showOkAlert(message: "Please Select Your Gender.")
    }else if textDOB.text == ""{
        showOkAlert(message: "Please Please Enter Your DOB.")
        
    }else if !(textPassword.text?.isValidPassword)!{
        showOkAlert(message: "The Password should consist at least 8 characters.")
        
    }
    else if Reachability.isConnectedToNetwork(){
        showProgressOnView(self.view)
          
        let userIdStr = String(UserDefaults.standard.value(forKey:  USER_DEFAULTS_KEYS.ID) as! Int)
        let param1:[String:String] =
            [    "patient_id": String(UserDefaults.standard.value(forKey:  USER_DEFAULTS_KEYS.ID) as! Int),
                "first_name" : textFirstName.text!,
                "last_name": textLastName.text!,
                "corporate_id": textOrganizasionName.text!,
                "employee_id": textEmployeeID.text!,
                "department_name": textDepartmentName.text!,
                "gender": textGender.text!,
                "date_of_birth": textDOB.text!,
                "password": textPassword.text!,
                    
                 
        ]
        print(param1)
        saveImageDocumentDirectory(usedImage: profileImage.image!, nameStr: "image.jpg")
        let userImageURL = URL(fileURLWithPath: (getDirectoryPath() as NSString).appendingPathComponent("image.jpg"))
    print(userImageURL)
        ServerClass.sharedInstance.sendImageMultipartRequestToServerWithToken(urlString: BASE_URL + PROJECT_URL.UPDATE_PROFILE_API + "/\(userIdStr)", sendJson: param1, imageUrl: userImageURL, imageKeyName: "customer_profile", successBlock: { (json) in
            print(json)
            hideProgressOnView(self.view)
            let status = json["status"].stringValue
            if status  == "true"  {
                iToast.show(json["message"].stringValue)
                
            }
            else {
                        iToast.show(json["message"].stringValue)
                    }
                }, errorBlock: { (NSError) in
                    iToast.show(kUnexpectedErrorAlertString)
                    hideProgressOnView(self.view)
                })
            }
            else{
                iToast.show("Please Check internet connection")
            }
}
}


