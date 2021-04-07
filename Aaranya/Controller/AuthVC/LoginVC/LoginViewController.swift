//
//  ViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 03/02/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK:- Outlet for textField
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textMobile: UITextField!
    
    //MARK:- Outlet for button
    @IBOutlet weak var passwordEyeBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    //MARK:- Login Button Action
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        if !(textMobile.text?.isValidPhoneNumber)!{
            self.showOkAlert(message: "Please enter valid mobile number.")
            
        }else if !(textPassword.text?.isValidPassword)!{
            showOkAlert(message: "Password is wrong")
            
        }else if Reachability.isConnectedToNetwork(){
            showProgressOnView(self.view)
            guard let mobile = textMobile.text  else {
                return
            }
            print(mobile)
            guard let password = textPassword.text else {
                return
            }
            
        let param1:[String:String] = [
            "mobile": mobile,
            "password": password,
            
        ]
        print(param1)
        ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.LOGIN_API, sendJson: param1, successBlock: { (json) in
            print(json)
            hideProgressOnView(self.view)
            let status = json["status"].stringValue
            let otp_status = json["data"]["otp_status"].stringValue
            let first_name = json["data"]["first_name"].stringValue
            let last_name = json["data"]["last_name"].stringValue
            
            print(otp_status)
            if status  == "true"  {
                
                
                UserDefaults.standard.setValue(otp_status, forKey: USER_DEFAULTS_KEYS.OTP_STATUS)
                UserDefaults.standard.setValue(first_name, forKey: USER_DEFAULTS_KEYS.FIRST_NAME)
                UserDefaults.standard.setValue(last_name, forKey: USER_DEFAULTS_KEYS.LAST_NAME)
               
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
               
                self.present(homeVC, animated: true, completion: nil)
                
                
            }else {
                self.showOkAlert(message: json["message"].stringValue)
                }
                
            
        }, errorBlock: { (NSError) in
            self.showOkAlert(message: kUnexpectedErrorAlertString)
            hideProgressOnView(self.view)
        })
    }else{
    
        self.showOkAlert(message: "Please Check internet connection")
    
    }
}
    
    //MARK:- ForgotPassword Button Action
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
        
        
        let forgotVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        forgotVC.mobileNumber = textMobile.text!
        self.present(forgotVC, animated: true, completion: nil)
    }
    
    //MARK:- SignUp Button Action
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.present(signUpVC, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func passwordEyeButtonPressed(_ sender: Any) {
        
        if passwordEyeBtn.image(for: .normal)!.pngData() == UIImage(named: "viewer")!.pngData() {
            passwordEyeBtn.setImage(#imageLiteral(resourceName: "eye_hide"), for: .normal)
            textPassword.isSecureTextEntry = true
        }
        else {
            passwordEyeBtn.setImage(#imageLiteral(resourceName: "eye_icon"), for: .normal)
            textPassword.isSecureTextEntry = false

        }
    }
    
}

