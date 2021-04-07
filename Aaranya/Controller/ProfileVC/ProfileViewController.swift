//
//  ProfileViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var qualificationLabel: UILabel!
    
    @IBOutlet weak var coorporateNameLabel: UILabel!
    @IBOutlet weak var firstLastNameLabel: UILabel!
    @IBOutlet weak var employeeIDLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        self.homeAPI()
//    }
//
//
//
}
}

extension ProfileViewController{
    
    func homeAPI() {
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1 : [String : String] = [
                
                "patient_id" :  String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.ID) as? Int)!)
            ]
            print(param1)
            ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: BASE_URL + PROJECT_URL.PROFILE_API, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                print(status)
                let first_name = json["data"]["first_name"].stringValue
                let last_name = json["data"]["last_name"].stringValue
                let full_name = "\(first_name) \(last_name)"
                self.firstLastNameLabel.text = full_name
                let employee_id = json["data"]["employee_id"].stringValue
                    self.employeeIDLabel.text = employee_id
                let mobile = json["data"]["mobile"].stringValue
                    self.mobileLabel.text = mobile
                let location = json["data"]["location"].stringValue
                    self.locationLabel.text = location
                
                let corporate_name = json["data"]["corporate_name"].stringValue
                    self.coorporateNameLabel.text =  corporate_name
                let data = json["data"]
                if status  == "true"{
                    
                    
                    print(data["mobile"].stringValue)
                    
                    
                
                
                
                }
                else {
                    self.showOkAlert(message:json["message"].stringValue)
                }
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
        }
        else{
            showOkAlert(message: "Please Check internet connection")
        }
    }
}
