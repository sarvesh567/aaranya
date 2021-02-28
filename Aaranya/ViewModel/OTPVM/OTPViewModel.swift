//
//  OTPViewModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 06/02/21.
//

import Foundation

extension OTPViewController {
     func verifyOTPAPI() {
        if !(otpTextField1.text != "" && otpTextField2.text != "" && otpTextField3.text != "" && otpTextField4.text != "") {
            self.showOkAlert(message: "Please enter valid otp")
            
        }
        else if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1:[String:String] = [
                "mobile": mobileNumber,
                "otp": "\(otpTextField1.text!)\(otpTextField2.text!)\(otpTextField3.text!)\(otpTextField4.text!)",
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.VERIFY_OTP_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                
                let status = json["status"].stringValue
                let message = json["message"].stringValue
                print(message)
                let data = json["data"].dictionaryObject
                data?.forEach({ (key, value) in
                    print("Key: \(key) Value: \(value)")
                })
                
                
                if status == "true" && data?["otp_status"] as! String == "yes" {
                    
                    UserDefaults.standard.setValue(data?["id"], forKey: USER_DEFAULTS_KEYS.ID)
                    
                    UserDefaults.standard.setValue(data?["mobile"], forKey: "mobile")
                    
                    let userDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
                    self.present(userDetailVC, animated: true, completion: nil)
                    
                }else{
                    self.showOkAlert(message: json["message"].stringValue)
                }
                
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
        }
        else{
            self.showOkAlert(message:"Please Check internet connection" )
        }
    }
}
    

extension ForgotOTPViewController {
     func forgotOtpVerifyOTPAPI() {
        if !(otpTextField1.text != "" && otpTextField2.text != "" && otpTextField3.text != "" && otpTextField4.text != "") {
            self.showOkAlert(message: "Please enter valid otp")
            
        }
        else if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1:[String:String] = [
                "mobile": mobileNumber,
                "otp": "\(otpTextField1.text!)\(otpTextField2.text!)\(otpTextField3.text!)\(otpTextField4.text!)",
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.VERIFY_OTP_API, sendJson: param1, successBlock: { [self] (json) in
                print(json)
                hideProgressOnView(self.view)
                
                let status = json["status"].stringValue
                
                if status == "true" {
                    
                    let setPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "SetPasswordViewController") as! SetPasswordViewController
                    setPasswordVC.mobileNumber =  mobileNumber
                    self.present(setPasswordVC, animated: true, completion: nil)
                    
                }else{
                    self.showOkAlert(message: json["message"].stringValue)
                }
                
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
        }
        else{
            self.showOkAlert(message:"Please Check internet connection" )
        }
    }
    
    
    
    
    
    
    
}
    



