//
//  OTPViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
   
    @IBOutlet weak var resedOtpButton: UIButton!
    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField1: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    
   
    var mobileNumber: String = ""
    var count = 30
    var isRunning = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = "\(count)"
        isRunning = true
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
        
       
    
    

@objc func updateCounter() {
    
    count -= 1
    if count >= 0{
        timerLabel.text = String(count)
    }
    
}
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewDidLoad()
        
        mobileLabel.text = mobileNumber
        otpTextField1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
       
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if  text?.count == 1 {
            switch textField{
            case otpTextField1:
                otpTextField2.becomeFirstResponder()
            case otpTextField2:
                otpTextField3.becomeFirstResponder()
            case otpTextField3:
                otpTextField4.becomeFirstResponder()
            default:
                break
            }
        }
        if  text?.count == 0 {
            switch textField{
            case otpTextField1:
                otpTextField1.becomeFirstResponder()
            case otpTextField2:
                otpTextField1.becomeFirstResponder()
            case otpTextField3:
                otpTextField2.becomeFirstResponder()
            case otpTextField4:
                otpTextField3.becomeFirstResponder()
            default:
                break
            }
        }
        else{
            
        }
    }
    

    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        verifyOTPAPI()
    }
    
    
    @IBAction func resendOtpButtonPressed(_ sender: Any) {
        
        sendOTPAPI()
    }
    
    @IBAction func backToLoginButtonPressed(_ sender: Any) {
        
        
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
             present(loginVC, animated: true, completion: nil)
    
    }
}

