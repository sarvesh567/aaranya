

import Foundation
struct Data : Codable {
	let fcm_token : String?
	let profile_img : String?
	let gender : String?
	let email : String?
	let id : Int?
	let otp : String?
	let password : String?
	let date_of_birth : String?
	let otp_status : String?
	let password_status : String?
	let mobile : String?
	let employee_id : String?
	let first_name : String?
	let last_name : String?
	let location : String?
	let employee_id_img : String?
	let status : String?
	let corporate_id : String?

	enum CodingKeys: String, CodingKey {

		case fcm_token = "fcm_token"
		case profile_img = "profile_img"
		case gender = "gender"
		case email = "email"
		case id = "id"
		case otp = "otp"
		case password = "password"
		case date_of_birth = "date_of_birth"
		case otp_status = "otp_status"
		case password_status = "password_status"
		case mobile = "mobile"
		case employee_id = "employee_id"
		case first_name = "first_name"
		case last_name = "last_name"
		case location = "location"
		case employee_id_img = "employee_id_img"
		case status = "status"
		case corporate_id = "corporate_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		fcm_token = try values.decodeIfPresent(String.self, forKey: .fcm_token)
		profile_img = try values.decodeIfPresent(String.self, forKey: .profile_img)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		otp = try values.decodeIfPresent(String.self, forKey: .otp)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		date_of_birth = try values.decodeIfPresent(String.self, forKey: .date_of_birth)
		otp_status = try values.decodeIfPresent(String.self, forKey: .otp_status)
		password_status = try values.decodeIfPresent(String.self, forKey: .password_status)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		employee_id = try values.decodeIfPresent(String.self, forKey: .employee_id)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		employee_id_img = try values.decodeIfPresent(String.self, forKey: .employee_id_img)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		corporate_id = try values.decodeIfPresent(String.self, forKey: .corporate_id)
	}

}
