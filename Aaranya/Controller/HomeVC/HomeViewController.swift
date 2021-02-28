//
//  HomeViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 04/02/21.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    //MARK:- IBOutlet for collectionView
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    @IBOutlet weak var collectionView4: UICollectionView!
    @IBOutlet weak var collectionView5: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var collection2ViewHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var collection4ViewHeightConstraints: NSLayoutConstraint!
    //MARK:- IBOutlet for label
    @IBOutlet weak var nameLabel: UILabel!
   
    let first_name = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.FIRST_NAME)
    let last_name = UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.LAST_NAME)
    
    var serviceResponseModelArray = [ServiceResponseModel]()
    var ongoingSessionResponseArray = [OngoingSessionResponseModel]()
    var todayScheduleResponseModelArray = [TodayScheduleResponseModel]()
    var yourHealerResponseModelArray = [YourHealerResponseModel]()
    var ongoingSessionResponse = OngoingSessionResponseModel()
    var enrolledSessionResponseModelArray = [EnrolledSessionResponseModel]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Good Morning \(first_name!) \(last_name!)"
        
        homeAPI()
        
    }
   
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView1{
            
            self.collectionViewHeightConstraints.constant = CGFloat(self.serviceResponseModelArray.count * 90)
            return serviceResponseModelArray.count
            
        }else if collectionView == self.collectionView2{
            self.collection2ViewHeightConstraints.constant = CGFloat(self.ongoingSessionResponseArray.count * 170)
            return ongoingSessionResponseArray.count
            
           
        }else if collectionView == self.collectionView3{
            return todayScheduleResponseModelArray.count
        }else if collectionView == self.collectionView4{
            self.collection4ViewHeightConstraints.constant = CGFloat(self.ongoingSessionResponseArray.count * 170)
            return self.enrolledSessionResponseModelArray.count
        }else{
            
            return yourHealerResponseModelArray.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionView1.self{
            
            let cell: ServicesCollectionViewCell = collectionView1.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
            cell.title.text = serviceResponseModelArray[indexPath.row].title
            //Image Parse
            let imageURL = URL(string: serviceResponseModelArray[indexPath.row].icon)
            cell.imgIcon.contentMode = .scaleAspectFill
            cell.imgIcon.kf.setImage(with: imageURL)
            return cell
            
        }else if collectionView == collectionView2.self{
            let cell: OngoingSessionCollectionViewCell = collectionView2.dequeueReusableCell(withReuseIdentifier: "OngoingSessionCollectionViewCell", for: indexPath) as! OngoingSessionCollectionViewCell
                let imageURL = URL(string: ongoingSessionResponseArray[indexPath.row].logo_image)
                cell.imgLogo.contentMode = .scaleAspectFill
                cell.imgLogo.kf.setImage(with: imageURL)
            cell.enrolledLabel.text = ongoingSessionResponseArray[indexPath.row].enrolled
           // cell.meetingNameLabel.text = ongoingSessionResponseArray[indexPath.row].meeting_name
             cell.meetingNameLabel.text = "Acuressure Appointment"
            
            let firstName = ongoingSessionResponseArray[indexPath.row].first_name
            let lastName =  ongoingSessionResponseArray[indexPath.row].last_name
            let fullName = ("Taken By \(firstName) \(lastName)")
            cell.firstLastNameLabel.text = fullName
            
            let time = ongoingSessionResponseArray[indexPath.row].time
            let end =  ongoingSessionResponseArray[indexPath.row].end
            let totalTime = ("\(time)  \("-") \(end) \("AM")")
            cell.dateLabel.text = totalTime
            cell.firstLastNameLabel.text = fullName
            cell.typeName.text = ongoingSessionResponseArray[indexPath.row].name
            return cell
            
        }else if collectionView == self.collectionView3{
            
            let cell: TodayScheduleCollectionViewCell = collectionView3.dequeueReusableCell(withReuseIdentifier: "TodayScheduleCollectionViewCell", for: indexPath) as! TodayScheduleCollectionViewCell
            let imageURL = URL(string: ongoingSessionResponseArray[indexPath.row].logo_image)
            cell.imgLogo.contentMode = .scaleAspectFill
            cell.imgLogo.kf.setImage(with: imageURL)
            
            let firstName = ongoingSessionResponseArray[indexPath.row].first_name
            let lastName =  ongoingSessionResponseArray[indexPath.row].last_name
            let fullName = ("\(firstName) \(lastName)")
            cell.firstLastNameLabel.text = fullName
            cell.serviceLabel.text = todayScheduleResponseModelArray[indexPath.row].service
            return cell
            
        }else if collectionView == collectionView5{
            
            let cell: YourHealerCollectionViewCell = collectionView5.dequeueReusableCell(withReuseIdentifier: "YourHealerCollectionViewCell", for: indexPath) as! YourHealerCollectionViewCell
            
            let imageURL = URL(string: yourHealerResponseModelArray[indexPath.row].logo_image)
            cell.imgLogo.contentMode = .scaleAspectFill
            cell.imgLogo.kf.setImage(with: imageURL)
            
            let firstName = yourHealerResponseModelArray[indexPath.row].first_name
            let lastName =  yourHealerResponseModelArray[indexPath.row].last_name
            let fullName = ("\(firstName) \(lastName)")
            cell.firstLastNameLabel.text = fullName
            cell.serviceLabel.text = yourHealerResponseModelArray[indexPath.row].service
            
            return cell
            
            
        }else{
            let cell: EnrollmentCollectionViewCell = collectionView4.dequeueReusableCell(withReuseIdentifier: "EnrollmentCollectionViewCell", for: indexPath) as! EnrollmentCollectionViewCell
            let firstName = enrolledSessionResponseModelArray[indexPath.row].first_name
            let lastName =  enrolledSessionResponseModelArray[indexPath.row].last_name
           
             let fullName = ("Taken By \(firstName) \(lastName)")
            cell.firstLastName.text = fullName
            let imageURL = URL(string: enrolledSessionResponseModelArray[indexPath.row].logo_image)
            cell.logoImage.contentMode = .scaleAspectFill
            cell.logoImage.kf.setImage(with: imageURL)
            cell.timeLabel.text =  enrolledSessionResponseModelArray[indexPath.row].time
            
            
            cell.enrolledLabel.text = enrolledSessionResponseModelArray[indexPath.row].enrolled
            
            cell.meetingName.text = enrolledSessionResponseModelArray[indexPath.row].meeting_name
            
            let mtype = enrolledSessionResponseModelArray[indexPath.row].mtype
            if mtype == "1"{
                
                cell.meetingName.text = "Appointment"
            }else if mtype == "2"{
                cell.meetingName.text = "Group Class"
                
                
            }else if mtype == "3"{
                cell.meetingName.text = "Live Class"
            }
            
            return cell
            
            
            
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionView2{
        let ongoingSessionVC = self.storyboard?.instantiateViewController(withIdentifier: "OngoingSesssionViewController") as! OngoingSesssionViewController

        ongoingSessionVC.mtype  =    ongoingSessionResponseArray[indexPath.row].mtype
        ongoingSessionVC.date  =    ongoingSessionResponseArray[indexPath.row].date
        ongoingSessionVC.schedule_id  =    ongoingSessionResponseArray[indexPath.row].schedule_id
            ongoingSessionVC.healer_id  =    ongoingSessionResponseArray[indexPath.row].id
        present(ongoingSessionVC, animated: true, completion: nil)
        
        }else if collectionView == self.collectionView1{
            
            let serviceVC = self.storyboard?.instantiateViewController(withIdentifier: "ServiceViewController") as! ServiceViewController
       present(serviceVC, animated: true, completion: nil)
        }
}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        if collectionView == collectionView1.self{
            return CGSize(width: (self.view.frame.size.width - 60)/2, height: (self.view.frame.size.width - 60)/2)
        }else if collectionView == collectionView2.self{
            
            return CGSize(width: 330, height: 150)
        
        }else if collectionView == self.collectionView3{
            
            return CGSize(width: 260, height: 330)
            
        }else if collectionView == self.collectionView4{
            return CGSize(width: 370, height: 150)
            
        }else{
            
            return CGSize(width: 216, height: 235)
        }
       
       
    }
  
    
}
