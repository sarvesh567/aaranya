//
//  SlideMenuVC.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 13/03/21.
//

import UIKit

class SlideMenuVC: UIViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 80
    }
    
    //MARK:- IBAction_FOR_ACCOUNT_BUTTON
    @IBAction func accountButtonPressed(_ sender: UIButton){
        
        let viewController = UIStoryboard.profileViewController()
        present(viewController, animated: true, completion: nil
        )
        
        
    }
    
    //MARK:- IBAction_FOR_CALENDAR_BUTTON
    @IBAction func calendarButtonPressed(_ sender: Any) {
    }
    
    
    //MARK:- IBAction_FOR_HISTORY_BUTTON
    @IBAction func historyButtonPressed(_ sender: Any) {
    }
    

}


