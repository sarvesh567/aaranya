//
//  OngoingSesssionViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 07/02/21.
//

import UIKit
import FSCalendar

class OngoingSesssionViewController: UIViewController, DatePassDalegate{
    func datePassing(date: String) {
        textDate.text = date
        dateLabel.text = textDate.text
        
        
    }
    
    
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var pageController1: UIPageControl!
    @IBOutlet weak var collectionView3: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView1: UICollectionView!
    
    //MARK:- IBoutlet for label
    @IBOutlet weak var benifitLabel1: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var benifitLabel2: UILabel!
    @IBOutlet weak var serviceNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK:- IBoutlet for textField
    
    @IBOutlet weak var textDate: UITextField!
    var imageArray = [#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "3")]
    var timer = Timer()
    var counter = 0
    
    
    var mtype:String = ""
    var schedule_id:String = ""
    var date:String = ""
    var healer_id = ""
    var time = ""
    var slot_id = ""
    
    
    
    
    var healerResponseModelArray = [HealerResponseModel]()
    var availableScheduleResponseModelArray = [AvailableScheduleResponseModel]()
    var availableScheduleResponseModel = AvailableScheduleResponseModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getScheduleAPI()
        self.collectionView2.reloadData()
        
        textDate.text = currentDate()
        pageController.numberOfPages = imageArray.count
        pageController.currentPage = 0
        pageController1.numberOfPages = imageArray.count
        pageController1.currentPage = 0
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
        //MARK:- TapGesture
        let textFieldGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnTextField))
        textDate.addGestureRecognizer(textFieldGesture)
        
        
    }
    
    
    @objc func tapOnTextField(){
        
        
        let calanderVC = self.storyboard?.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        calanderVC.mtype  = mtype
        calanderVC.schedule_id  = schedule_id
        calanderVC.healer_id  =  healer_id
        calanderVC.delegate = self
        
        present(calanderVC, animated: true, completion: nil)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        blueView.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        
    }
    
    @objc func changeImage()  {
        let index = IndexPath.init(item: counter, section: 0)
        if counter < imageArray.count{
            
            self.collectionView1.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.collectionView3.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            pageController.currentPage = counter
            pageController1.currentPage = counter
            
            counter += 1
            
            
        }else{
            
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView1.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            self.collectionView3.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            
            pageController.currentPage = counter
            pageController1.currentPage = counter
            counter = 1
        }
    }
    
    
    @IBAction func backToHomeButtonPressed(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.present(homeVC, animated: true, completion: nil)
    }
    
    

    @IBAction func enrollbuttonPressed(_ sender: Any) {
        
        
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            
            let param1 : [String : String] = [
                "mtype" :  mtype,
                "schedule_id" : schedule_id,
                "corporate_id" : String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.CORPORATE_ID) as? Int)!),
                "date": textDate.text ?? "",
                "healer_id": healer_id,
                "slot_id": slot_id,
                "patient_id" : String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.ID) as? Int)!),
               
                "time": time
            ]
            print(param1)
            ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: BASE_URL + PROJECT_URL.BOOK_APPOINTMENT_API, successBlock: { [self] (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
               
                if status  == "true"{
                    
                    let enrollPopUpVC = self.storyboard?.instantiateViewController(withIdentifier: "EnrollSuccessPopUpViewController") as! EnrollSuccessPopUpViewController
                    self.collectionView2.reloadData()
                    self.present(enrollPopUpVC, animated: true, completion: nil)
                    collectionView2.reloadData()
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

extension OngoingSesssionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView1{
            return imageArray.count
        }else if collectionView == self.collectionView2{
            return availableScheduleResponseModelArray.count
        }else{
            return 10
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1.self{
            let cell: OngoingPageCollectionViewCell = collectionView1.dequeueReusableCell(withReuseIdentifier: "OngoingPageCollectionViewCell", for: indexPath) as! OngoingPageCollectionViewCell
            cell.imgView.image = imageArray[indexPath.row]
            return cell
        }else if collectionView == self.collectionView2{
            
            
            let cell: AvailableSchedualCollectionViewCell = collectionView2.dequeueReusableCell(withReuseIdentifier: "AvailableSchedualCollectionViewCell", for: indexPath) as! AvailableSchedualCollectionViewCell
            
            let time12 = convert24HTo12H(timeIn24H: availableScheduleResponseModelArray[indexPath.row].time)
            print(time12)
            let end12 = convert24HTo12H(timeIn24H: String(availableScheduleResponseModelArray[indexPath.row].end))
            print(end12)
            cell.timeLabel.text = "\(time12) -  \(end12)"
            
            
            
            return cell
            
        }else{
            
            let cell: HappyFaceCollectionViewCell  = collectionView3.dequeueReusableCell(withReuseIdentifier: "HappyFaceCollectionViewCell", for: indexPath) as! HappyFaceCollectionViewCell
            return cell
        }
        
        
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {


        if collectionView == self.collectionView2{

            if let cell = collectionView2.cellForItem(at: indexPath) as? AvailableSchedualCollectionViewCell{
                var id =  availableScheduleResponseModelArray[indexPath.row].id
                print(id)
                slot_id.append(id)

                cell.contentView.backgroundColor = UIColor.systemOrange
                timeLabel.text = cell.timeLabel.text
                let time12 = convert24HTo12H(timeIn24H: availableScheduleResponseModelArray[indexPath.row].time)
                let time = convert12HTo24H(timeIn12H: String(time12))
                 self.time.append(time)
                print(String(time))


            }
        }


    }

    
//
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if let cell =  collectionView2.cellForItem(at: indexPath) as? AvailableSchedualCollectionViewCell{
//            cell.contentView.backgroundColor = UIColor.gray
//
//
//        }
//
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView1.self{
            
            return CGSize(width: 414 , height: 300)
        }else if collectionView == self.collectionView2{
            
            return CGSize(width: 160 , height: 80  )
        }else{
            
            return CGSize(width: 350 , height: 150  )
            
        }
        
    }
}


