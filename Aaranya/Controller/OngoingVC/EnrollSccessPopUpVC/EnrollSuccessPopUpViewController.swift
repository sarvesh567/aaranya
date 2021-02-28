//
//  EnrollSuccessPopUpViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 10/02/21.
//

import UIKit

class EnrollSuccessPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func doneButtonPressed(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(homeVC, animated: true, completion: nil)
    }
    

}
