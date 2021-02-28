//
//  ForgotPasswordViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit
import Foundation
class SetPasswordViewController: UIViewController {

   
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textConfirmedPassword: UITextField!
    
    var mobileNumber: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backToForgotOTPButtonPressed(_ sender: Any) {
        
        let forgotOTPVC = self.storyboard?.instantiateViewController(withIdentifier: "ForgotOTPViewController") as! ForgotOTPViewController
        self.present(forgotOTPVC, animated: true, completion: nil)
        
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        if !(textPassword.text?.isValidPassword)!{
            showOkAlert(message: "The Password should consist at least 8 characters.")
        }else if !(textConfirmedPassword.text == textPassword.text){
            
            showOkAlert(message: "Password do not match 😒")
            
        }else if Reachability.isConnectedToNetwork(){
            
            showProgressOnView(self.view)
              let param1:[String:String] =
                [   "mobile": mobileNumber,
                    "password": textPassword.text!,
                    "confirm_password": textConfirmedPassword.text!,

                                             ]
            print(param1)
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.FORGOT_PASSWORD_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
               
                
                if status  == "true"  {

                    let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    self.present(loginVC, animated: true, completion: nil)



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


