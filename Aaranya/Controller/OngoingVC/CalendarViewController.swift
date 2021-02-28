//
//  CalendarViewController.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 10/02/21.
//

import UIKit
import FSCalendar

protocol DatePassDalegate {
    func datePassing(date: String)
}
class CalendarViewController: UIViewController {
    @IBOutlet weak var selectedDate: UILabel!
    
    @IBOutlet var calendar: FSCalendar!
   
    
    var slot_id:String = ""
    var healerResponseModelArray = [HealerResponseModel]()
    var availableScheduleResponseModelArray = [AvailableScheduleResponseModel]()
    var mtype:String = ""
    var schedule_id:String = ""
//    var date:String = ""
    var healer_id = ""
    var delegate: DatePassDalegate!
      override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        selectedDate.text = "Plese Select Date"
       
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
       
       dismiss(animated: true, completion: nil)
        
        delegate.datePassing(date: selectedDate.text! )
        print(selectedDate.text!)
        print("::::::::::::::\(slot_id)")
        
        getScheduleAPI()
        
    }
    
    
}

extension CalendarViewController: FSCalendarDelegate{
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let string = formatter.string(from: date)
        selectedDate.text = "\(string)"
        
        selectedDate.isHidden = false
        
    }
    
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let string = formatter.string(from: date)
        
        selectedDate.text = "Selected Date: \(string)"
        
    }
    
    
}
