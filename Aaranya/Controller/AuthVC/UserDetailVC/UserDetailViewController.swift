//
//  UserDetailViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 05/02/21.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var idCardButton: UIButton!
    @IBOutlet weak var idcardImage: UIImageView!
    @IBOutlet weak var knowMoreButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textOrganisation: UITextField!
    @IBOutlet weak var textEmployee: UITextField!
    @IBOutlet weak var textDepartment: UITextField!
    @IBOutlet weak var textGender: UITextField!
    @IBOutlet weak var textDOB: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    

    
    
    
    @IBAction func uploadPhotoButtonPressed(_ sender: Any) {
        
        
        uploadProfilePhotoAction()
        
        
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        if textFirstName.text == ""{
            showOkAlert(message: "Please enter First Name")
            
            
        }else if textLastName.text == ""{
            showOkAlert(message: "Please enter Last Name")
            
        }else if textOrganisation.text == "" {
            showOkAlert(message: "Please enter Organisation Code")
            
        }else if textEmployee.text == ""{
            showOkAlert(message: "Please enter Employee ID")
        }else if textDepartment.text == ""{
            showOkAlert(message: "Please enter Depart Name")
        }
        else if textDepartment.text == ""{
            showOkAlert(message: "Please enter Depart Name")
        }else if textGender.text == ""{
            showOkAlert(message: "Please select your Gender")
            
        }else if textDOB.text == ""{
            showOkAlert(message: "Please select your DOM")
            
        }else if textPassword.text == ""{
            showOkAlert(message: "Please enter password")
        }else if Reachability.isConnectedToNetwork(){
            //showProgressOnView(self.view)
            let s1 = "\""
            let s3 = "\""
            let s2 =  UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.ID) as! Int
            
            
            let patientIdStr = s1 + String(s2) + s3
            print("##:::::::::::\(patientIdStr)")
           
            let param1:[String:Any] = [
                "patient_id": String(UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.ID) as! Int),
                "first_name": self.textFirstName.text!,
                "last_name": self.textLastName.text!,
                "password": self.textPassword.text!,
                "gender" : self.textGender.text!,
                "date_of_birth" : self.textDOB.text!,
                "employee_id" : self.textEmployee.text!,
                "corporate_id" : self.textOrganisation.text!,
                
            ]
            print(param1)
            
            ServerClass.sharedInstance.sendMultipartRequestToServer(urlString: BASE_URL + PROJECT_URL.UPDATE_PROFILE_API, sendJson: param1, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let data = json["data"].dictionaryObject
                data?.forEach({ (key, value) in
                    print("Key: \(key) Value: \(value)")
                })
                
                let status = json["status"].stringValue
                
                if status == "true"{
                    UserDefaults.standard.setValue(data?["corporate_id"], forKey: USER_DEFAULTS_KEYS.CORPORATE_ID )
                    print("Wow!!!")
                }else{
                    iToast.show(json["message"].stringValue)
                    hideAllProgressOnView(self.view)
                }
                
            }, errorBlock: { (NSError) in
                iToast.show(kUnexpectedErrorAlertString)
                hideAllProgressOnView(self.view)
            })
        }
        else{
            self.showOkAlert(message:"Please Check internet connection" )
        }
    }
        
    
    
    @IBAction func uploadEmployeeCardPressed(_ sender: Any) {
        
        uploadIDCardAction()
         
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
    
    //MARK:- IDCard
    fileprivate func uploadIDCardAction() {
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
    
    
    //MARK:- ProfilePhotoImage(/*@START_MENU_TOKEN@*/"Image Name"/*@END_MENU_TOKEN@*/)
    fileprivate func uploadProfilePhotoAction() {
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
  }


