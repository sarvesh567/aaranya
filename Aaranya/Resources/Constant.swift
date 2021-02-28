//
//  Constant.swift
//  Aaranya
//
//  Created by Sarvesh Patel on 05/02/21.
//

import Foundation

let BASE_URL = "https://team-dev.aaranyawellness.com/api/"
let kUnexpectedErrorAlertString = "An unexpected error has occurred. Please try again." as String

struct PROJECT_URL {
    /****** COMMON API ******/
    
    static let LOGIN_API =    "patient/login"
    static let SEND_OTP_API = "send-otp-patient"
    static let VERIFY_OTP_API = "otp-verify-pesent"
    static let UPDATE_PROFILE_API = "update-profile"
    static let FORGOT_PASSWORD_API = "patient/change_password"
    static let HOME_API = "patient/get-home-data"
    static let PROFILE_API = "get-profile"
    static let Schedule_API = "get-schedule-detail"
    static let KNOW_HEALER_API = "get-schedule-detail"
    static let BOOK_APPOINTMENT_API = "book-appointment"
    static let BOOKING_HISTORY_API = "booking-history"
    
    
    
   
    
}


struct USER_DEFAULTS_KEYS {
   
    static let ID = "patient_id"
    static let CORPORATE_ID = "corporate_id"
    static let FIRST_NAME = "first_name"
    static let LAST_NAME = "last_name"
    static let OTP_STATUS = "otp_status"
    static let MOBILE_NUMBER = "mobile"
    static let SLOT_ID = "date"
    
}
