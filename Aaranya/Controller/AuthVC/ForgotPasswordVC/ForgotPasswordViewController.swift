//
//  ForgotPasswordViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    
    @IBOutlet weak var textMobile: UITextField!
    var mobileNumber: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textMobile.text = mobileNumber
        
    }
    

    @IBAction func nextButtonPressed(_ sender: Any) {
        
        
        if !(textMobile.text?.isValidPhoneNumber)!{
            showOkAlert(message: "Please enter valid mobile number")
        }else if Reachability.isConnectedToNetwork(){
            showProgressOnView(self.view)
           
                    
            sendOTPForPasswordAPI()
                    
        }
          
    }
    @IBAction func backTOforgotOTPVC(_ sender: Any) {
        
        
        
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                 present(loginVC, animated: true, completion: nil)
        
        
        
    }
}
    


