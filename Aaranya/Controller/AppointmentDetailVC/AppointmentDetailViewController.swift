//
//  AppointmentDetailViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit
import FSCalendar

class AppointmentDetailViewController: UIViewController {
    @IBOutlet weak var appointmentView: UIView!
    
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tableViewHeightConstraints: NSLayoutConstraint!
    
    var nameArray = ["Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel","Sarvesh Patel"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    override func viewDidLayoutSubviews() {
        topView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        appointmentView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        blueView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        self.tableViewHeightConstraints.constant = CGFloat(self.nameArray.count * 350)
       
    }
    




}

extension AppointmentDetailViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AppointmentDetailTableViewCell = tableView1.dequeueReusableCell(withIdentifier: "AppointmentDetailTableViewCell") as! AppointmentDetailTableViewCell
       
        cell.name.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
     
}

