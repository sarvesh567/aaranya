//
//  Extension+Document+Directory.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 05/02/21.
//

import Foundation
import UIKit

let appDelegateInstance = UIApplication.shared.delegate as! AppDelegate
let homeViewController = appDelegateInstance.window?.rootViewController as! HomeViewController



//MARK:-document directory realted method
public func getDirectoryPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

public func saveImageDocumentDirectory(usedImage:UIImage, nameStr:String) {
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(nameStr)
    let imageData = usedImage.jpegData(compressionQuality: 0.7)
    fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
}


//MARK:- Initialise App
func initialiseAppWithController(_ controller : UIViewController) {
    let navigationController = UINavigationController(rootViewController: controller)
    navigationController.isNavigationBarHidden = true
    
    let homeViewController = UIStoryboard.homeViewController()
        appDelegateInstance.window?.rootViewController = homeViewController
    let loginViewController = UIStoryboard.homeViewController()
        appDelegateInstance.window?.rootViewController = loginViewController
}
