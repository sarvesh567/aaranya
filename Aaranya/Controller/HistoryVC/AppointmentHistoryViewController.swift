//
//  AppointmentHistoryViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 13/02/21.
//

import UIKit

class AppointmentHistoryViewController: UIViewController {
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var ongoingTableViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var completeTableViewHeightConstraints: NSLayoutConstraint!
    
    var nameArray = ["Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1 : [String : String] = [
                
                "patient_id" :  String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.ID) as? Int)!)
            ]
            print(param1)
            ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: BASE_URL + PROJECT_URL.BOOKING_HISTORY_API, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                
                if status  == "true"{
                    print("Success!!")
                }
                else {
                    self.showOkAlert(message:json["message"].stringValue)
                }
            }, errorBlock: { (NSError) in
                self.showOkAlert(message: kUnexpectedErrorAlertString)
                hideProgressOnView(self.view)
            })
        }
        else{
            showOkAlert(message: "Please Check internet connection")
        }
         
    }
 
}










extension AppointmentHistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if tableView == self.tableView1{
            self.ongoingTableViewHeightConstraints.constant = CGFloat(self.nameArray.count * 180)
            return nameArray.count
           
        }else{
            
            self.completeTableViewHeightConstraints .constant = CGFloat(self.nameArray.count * 180)
            return nameArray.count
           
        }
       
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tableView1{
            let cell = tableView1.dequeueReusableCell(withIdentifier: "OngoingHistoryTableViewCell") as! OngoingHistoryTableViewCell
            cell.nameLabel.text = nameArray[indexPath.row]
            return cell
        }else{
            let cell = tableView2.dequeueReusableCell(withIdentifier: "CompleteTableViewCell") as! CompleteTableViewCell
            cell.nameLabel.text = nameArray[indexPath.row]
            return cell
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView1{
            return 180
        }else{
            return 180
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
