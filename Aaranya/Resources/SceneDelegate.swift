//
//  SceneDelegate.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 03/02/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let kAppDelegate                            = UIApplication.shared.delegate as! AppDelegate
    let kStoryboardHome                         = "Main"

    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       /*
        if UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.OTP_STATUS) as? String ?? "" == "yes"{

            let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.window?.rootViewController = homeVC

            print("yaaaaaa")
        }else{

            let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.window?.rootViewController = loginVC
            print("naaaaaaa")
        }
       */
        
//        if UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.OTP_STATUS) as? String == "yes"{
//
//            initialiseAppWithController(UIStoryboard.homeViewController())
//            print("naaaaaaaaaaaa")
//        }else{
//
//            print("naaaaaaaaaaaa")
//        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

