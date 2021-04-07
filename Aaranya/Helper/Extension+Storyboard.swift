//
//  Extension+Storyboard.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 07/02/21.
//

import Foundation
import UIKit

extension UIStoryboard {
    class func mainStoryBoard() -> UIStoryboard{
        
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    
    }
    class func homeViewController() -> HomeViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
    }
    
    
    class func loginViewController() -> LoginViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
    }
    
    
    class func profileViewController() -> ProfileViewController {
        return mainStoryBoard().instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
    }
    
}
