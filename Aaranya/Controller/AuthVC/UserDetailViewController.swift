//
//  UserDetailViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    //MARK:- IBOutlet for image
    @IBOutlet weak var idCardImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    //MARK:- IBOutlet for textField
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textOrganizasionName: UITextField!
    @IBOutlet weak var textEmployeeID: UITextField!
    @IBOutlet weak var textDepartmentName: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textDOB: UITextField!
    @IBOutlet weak var textGender: UITextField!
    
    
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker.delegate = self
        
    
    }
    
    
    @IBAction func backTOTPVC(_ sender: Any) {
        
        
        let backToOTPVC = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
        self.present(backToOTPVC, animated: true, completion: nil)
    }
    

    @IBAction func uploadProfileButtonPressed(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Choose An Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
       
    }
    
    //MARK:- Submit Button  Action
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        
        
       // self.userDetailWithImage()
        
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
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.UPDATE_PROFILE_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let first_name = json["data"]["first_name"].stringValue
                let last_name = json["data"]["last_name"].stringValue
                UserDefaults.standard.setValue(first_name, forKey: USER_DEFAULTS_KEYS.FIRST_NAME)
                UserDefaults.standard.setValue(last_name, forKey: USER_DEFAULTS_KEYS.LAST_NAME)
                let status = json["status"].stringValue
                let data = json["data"].dictionaryObject
                data?.forEach({ (key, value) in
                    print("Key: \(key) Value: \(value)")
                })
                if status  == "true"  {

                    //MARK:- SaveData to UserDefault
                    UserDefaults.standard.setValue(data?["corporate_id"], forKey: USER_DEFAULTS_KEYS.CORPORATE_ID)
                    UserDefaults.standard.setValue(data?["first_name"], forKey: USER_DEFAULTS_KEYS.FIRST_NAME)
                    UserDefaults.standard.setValue(data?["last_name"], forKey: USER_DEFAULTS_KEYS.LAST_NAME)

                    let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
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


extension UserDetailViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openCamera() {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            //            showPopUpWithTitle(viewController: self, title: "Your device have not camera".localized)
        }
    }
    
    func openGallary() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            //            userImageView.contentMode = .scaleAspectFit
                profileImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
