//
//  SignUpViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var textMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
       
    }
    
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        sendOTPAPI()
         
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
    
        
            let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                 present(loginVC, animated: true, completion: nil)
        
    
    }
    
    @IBAction func backToLoginButtonPressed(_ sender: Any) {
    
    
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
             present(loginVC, animated: true, completion: nil)
    
    }
}

