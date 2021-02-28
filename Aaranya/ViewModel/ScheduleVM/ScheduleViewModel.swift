//
//  ScheduleViewModel.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 11/02/21.
//

import Foundation

extension OngoingSesssionViewController{
    func getScheduleAPI(){
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1 : [String : String] = [
                "mtype" :  mtype,
                "schedule_id" : schedule_id,
                "corporate_id" : String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.CORPORATE_ID) as? Int)!),
                "date": date,
                "healer_id": healer_id
            ]
            print(param1)
            ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: BASE_URL + PROJECT_URL.Schedule_API, successBlock: { [self] (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                let healer = json["data"]["healer"]
                let schedule = json["data"]["schedule"]
                
                
                
                if status  == "true"{
                    
                    
                    
                    //MARK:- Healer Data
                    for healers in healer.arrayValue{
                        
                        print(healers["benifit"])
                        self.healerResponseModelArray.append(HealerResponseModel(json: healers))
                    }
                    
                    print(self.healerResponseModelArray)
                    self.benifitLabel1.text = self.healerResponseModelArray[0].benifit
                    
                    self.benifitLabel2.text = self.healerResponseModelArray[0].benifit
                    self.serviceNameLabel.text = self.healerResponseModelArray[0].service
                    
                    let firstName = self.healerResponseModelArray[0].first_name
                    let lastName =  self.healerResponseModelArray[0].last_name
                    let fullName = ("\(firstName) \(lastName)")
                    self.fullNameLabel.text = fullName
                    
                    
                    //MARK:- Healer Schedule
                    for schedules in schedule.arrayValue{
                        
                        self.availableScheduleResponseModelArray.append(AvailableScheduleResponseModel(json: schedules))
                        
                    }
                    
                    DispatchQueue.main.async {
                        self.collectionView2.reloadData()
                    }
                    
                    
                    print(self.availableScheduleResponseModelArray)
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

extension CalendarViewController{
    
    func getScheduleAPI(){
        if Reachability.isConnectedToNetwork() {
            showProgressOnView(self.view)
            let param1 : [String : String] = [
                "mtype" : mtype,
                "schedule_id" : schedule_id,
                "corporate_id" : String((UserDefaults.standard.value(forKey: USER_DEFAULTS_KEYS.CORPORATE_ID) as? Int)!),
                "date": selectedDate.text as? String ?? "",
                "healer_id": healer_id
            ]
            print(param1)
            ServerClass.sharedInstance.postRequestWithUrlParameters(param1, path: BASE_URL + PROJECT_URL.Schedule_API, successBlock: { [self] (json) in
                print(json)
                hideProgressOnView(self.view)
                let status = json["status"].stringValue
                let healer = json["data"]["healer"]
                let schedule = json["data"]["schedule"]
                
                if status  == "true"{
                    
                    
                    
                    //MARK:- Healer Data
                    for healers in healer.arrayValue{
                        
                        print(healers["benifit"])
                        self.healerResponseModelArray.append(HealerResponseModel(json: healers))
                    }
                    
                    print(self.healerResponseModelArray)
                    
                    
                    //MARK:- Healer Schedule
                    for schedules in schedule.arrayValue{
                        
                        
                        print(schedules["time"])
                        self.availableScheduleResponseModelArray.append(AvailableScheduleResponseModel(json: schedules))
                    }
                    
                    print(self.availableScheduleResponseModelArray)
                   
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





