//
//  Extension+OKAlert.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 05/02/21.
//


import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    
    
    
    //MARK:- This function will show simple "OK" Alert.
    func showOkAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}



//MARK:- MBProgressHUD
func showProgressOnView(_ view:UIView) {
    let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text =  "Loading.."
}

func hideProgressOnView(_ view:UIView) {
    MBProgressHUD.hide(for: view, animated: true)
}



//MARK:- iToast
class iToast: NSObject {
    
    class func show(_ toastMessage: String?) {
        
        OperationQueue.main.addOperation({
            let keyWindow: UIWindow? = UIApplication.shared.keyWindow
            let toastView = UILabel()
        
            toastView.frame = CGRect(x: 20, y: keyWindow!.bounds.size.height - 50, width: keyWindow!.bounds.size.width - 40, height: 40.0)
            toastView.font = UIFont.systemFont(ofSize: 15)
            toastView.text = toastMessage
            toastView.textAlignment = NSTextAlignment.center
            toastView.textColor = UIColor.white
            toastView.layer.cornerRadius = 20
            toastView.layer.masksToBounds = true
            toastView.backgroundColor = UIColor.black
            toastView.alpha = 1.0
            keyWindow?.addSubview(toastView)
            UIView.animate(withDuration: 10.0, delay: 0.0, options: .curveEaseOut, animations: {
                toastView.alpha = 0.0
            }) { finished in
                toastView.removeFromSuperview()
            }
        })
    }
}


//MARK:- Alert
extension UIAlertController {
    class func showInfoAlertWithTitle(_ title: String?, message: String?, buttonTitle: String, viewController: UIViewController? = nil){
        DispatchQueue.main.async(execute: {
            let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction.init(title: buttonTitle, style: .default, handler: { (okayAction) in
                if viewController != nil {
                    viewController?.dismiss(animated: true, completion: nil)
                } else {
                    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
                }
            })
            alertController.addAction(okayAction)
            if viewController != nil {
                viewController?.present(alertController, animated: true, completion: nil)
            } else {
                UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
            }
        })
    }
}

//MARK:- Invalid Input Alert
func showInvalidInputAlert(_ fieldName : String) {
UIAlertController.showInfoAlertWithTitle("Error", message: String(format: "Please enter a valid " + "%@.",fieldName), buttonTitle: "Okay")
}
//MARK:- Alert Method
func showPasswordLengthAlert() {
    UIAlertController.showInfoAlertWithTitle("Error", message: "The Password should consist at least 8 characters.", buttonTitle: "OK")
}
