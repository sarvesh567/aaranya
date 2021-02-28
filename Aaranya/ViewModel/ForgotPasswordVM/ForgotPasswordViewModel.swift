//
//  ForgotViewModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 06/02/21.
//

import Foundation
import UIKit
extension ForgotPasswordViewController{
     func sendOTPForPasswordAPI() {
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
                    
                    
                    let otpVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotOTPViewController") as! ForgotOTPViewController
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
