//
//  HomeViewModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 08/02/21.
//

import Foundation
import UIKit

extension HomeViewController {
     
    
    func homeAPI() {
      
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1 : [String : String] = [
                "corporate_id" :  String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.CORPORATE_ID) as? Int)!),
                "patient_id" :  String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.ID) as? Int)!)
            ]
            print(param1)
            ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: BASE_URL + PROJECT_URL.HOME_API, successBlock: { (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                let packages = json["packages"]
                let schedule = json["schedule"]["ongoingschedule"]
                let todaySchedule = json["schedule"]["todayschedule"]
                let enrolledSchedule = json["schedule"]["enrolledschedulest"]
                
                let healers = json["healers"]
                
                if status  == "true"{
                    
                    //MARK:- Services
                    for package in packages.arrayValue {
                        
                        self.serviceResponseModelArray.append(ServiceResponseModel(json: package))
                    }
                    print(self.serviceResponseModelArray)
                    DispatchQueue.main.async {
                        self.collectionView1.reloadData()
                    }
                    
                    //Schedule
                    for schedules in schedule.arrayValue {
                        
                        self.ongoingSessionResponseArray.append(OngoingSessionResponseModel(json: schedules))
                        
                    }
                    print(self.ongoingSessionResponseArray)
                    DispatchQueue.main.async {
                        self.collectionView2.reloadData()
                    }
                    
                    //Today Schedule
                    for schedule in todaySchedule.arrayValue {
                        print(schedule["logo_image"])
                        print(schedule["first_name"])
                        print(schedule["last_name"])
                        print(schedule["service"])
                        print(schedule["mtype"])
                       
                        self.todayScheduleResponseModelArray.append(TodayScheduleResponseModel(json: schedule))
                    }
                    
                    print(self.todayScheduleResponseModelArray)
                    DispatchQueue.main.async {
                        self.collectionView3.reloadData()
                    }
                    
                    //Enrolled Schedule
                    for schedule in enrolledSchedule.arrayValue {
                        print(schedule["logo_image"])
                        print(schedule["first_name"])
                        print(schedule["last_name"])
                        print(schedule["service"])
                        print(schedule["mtype"])
                       
                        self.enrolledSessionResponseModelArray.append(EnrolledSessionResponseModel(json: schedule))
                        }
                    
                    print(self.enrolledSessionResponseModelArray)
                    DispatchQueue.main.async {
                        self.collectionView4.reloadData()
                    }
                    
                    //YourHealer Schedule
                    for healer in healers.arrayValue {
                        print(schedule["logo_image"])
                        print(schedule["first_name"])
                        print(schedule["last_name"])
                        print(schedule["service"])
                        
                        self.yourHealerResponseModelArray.append(YourHealerResponseModel(json: healer))
                        
                    }
                    print(self.yourHealerResponseModelArray)
                    DispatchQueue.main.async {
                        self.collectionView4.reloadData()
                    }
                    
                    
                    
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
