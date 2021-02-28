//
//  LoginViewModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 06/02/21.
//

import Foundation
import UIKit

extension SignUpViewController{
     func sendOTPAPI() {
        if !(textMobile.text?.isValidPhoneNumber)! {
            showOkAlert(message: "Please enter valid mobile number")
        }else if Reachability.isConnectedToNetwork(){
            showProgressOnView(self.view)
            
            let param1:[String:String] = ["mobile" : self.textMobile.text!,
                                          "platform" : "iOS"
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.SEND_OTP_API, sendJson: param1, successBlock: { [self] (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                print(status)
                //Remove existing User
                let domain = Bundle.main.bundleIdentifier!
                UserDefaults.standard.removePersistentDomain(forName: domain)
                UserDefaults.standard.synchronize()
                print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
                
                if status  == "true"  {
                    
                    UserDefaults.standard.setValue(textMobile.text, forKey: USER_DEFAULTS_KEYS.MOBILE_NUMBER)
                    let otpVC = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
                    otpVC.mobileNumber = self.textMobile.text!
                    self.present(otpVC, animated: true, completion: nil)
                    
                }
                else{
                    self.showOkAlert(message: json["message"].stringValue)
                }
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
            
        }else{
            
            showOkAlert(message: "Please Check internet connection")
        }
    }
}


extension LoginViewController{
     func sendOTPAPI() {
        if !(textMobile.text?.isValidPhoneNumber)! {
            showOkAlert(message: "Please enter valid mobile number")
        }else if Reachability.isConnectedToNetwork(){
            showProgressOnView(self.view)
            
            let param1:[String:String] = ["mobile" : self.textMobile.text!,
                                          "platform" : "iOS"
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.SEND_OTP_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                print(status)
                
                if status  == "true"  {
                    
                    UserDefaults.standard.setValue(self.textMobile.text, forKey: USER_DEFAULTS_KEYS.MOBILE_NUMBER)
                    let otpVC = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
                    otpVC.mobileNumber = self.textMobile.text!
                    self.present(otpVC, animated: true, completion: nil)
                    
                }
                else{
                    self.showOkAlert(message: json["message"].stringValue)
                }
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
            
        }else{
            
            showOkAlert(message: "Please Check internet connection")
        }
    }
}



extension OTPViewController{
     func sendOTPAPI() {
        let mobileNumber = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.MOBILE_NUMBER) as! String ?? ""
        if !(mobileNumber.isValidPhoneNumber) {
            showOkAlert(message: "Please enter valid mobile number")
        }else if Reachability.isConnectedToNetwork(){
            showProgressOnView(self.view)
            
            let param1:[String:String] = ["mobile" : mobileNumber,
               "platform" : "iOS"
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.SEND_OTP_API, sendJson: param1, successBlock: { [self] (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                print(status)
                
                if status  == "true"  {
                    
                    self.showOkAlert(message: json["message"].stringValue)
                        self.count = 31
                    timerLabel.text = String(count)
                    self.updateCounter()
                    
                }
                else{
                    self.showOkAlert(message: json["message"].stringValue)
                }
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
            
        }else{
            
            showOkAlert(message: "Please Check internet connection")
        }
    }
}


extension ForgotOTPViewController{
     func sendOTPAPI() {
        let mobileNumber = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.MOBILE_NUMBER) as! String ?? ""
        if !(mobileNumber.isValidPhoneNumber) {
            showOkAlert(message: "Please enter valid mobile number")
        }else if Reachability.isConnectedToNetwork(){
            showProgressOnView(self.view)
            
            let param1:[String:String] = ["mobile" : mobileNumber,
               "platform" : "iOS"
            ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.SEND_OTP_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                print(status)
                
                if status  == "true"  {
                    
                    self.showOkAlert(message: json["message"].stringValue)
                    self.count = 31
                    self.timerLabel.text = String(self.count)
                self.updateCounter()
                }
                else{
                    self.showOkAlert(message: json["message"].stringValue)
                }
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
            
        }else{
            
            showOkAlert(message: "Please Check internet connection")
        }
    }
}


