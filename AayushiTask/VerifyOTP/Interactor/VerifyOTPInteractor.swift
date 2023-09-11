//
//  VerifyOTPInteractor.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation
import Alamofire

class VerifyOTPInteractor: VerifyOTPPresentorToInteractorProtocol {
  
  // MARK: - Methods
  
  func verifyOTP(_ code: String, phone: String, type: OTPType, completion: @escaping (Bool, String) -> Void) {
    let parameters = ["otp": code, "phone": "+91\(phone)"]
    AF.request(type == .signup ? "https://api.staging.speedyy.com/user/customer/auth/register/verify" : "https://api.staging.speedyy.com/user/customer/auth/login/verify", method: .post, parameters: parameters).response { response in
      if(response.response?.statusCode == 200) {
        completion(true, "")
      }
      else {
        let str = String(decoding: response.data ?? Data(), as: UTF8.self)
        if let dict = str.getJsonDataDict() as? [String: Any] {
          if let errors = dict["errors"] as? [[String: Any]], errors.count > 0 {
            let error = errors.first
            let message = error?["message"] as? String ?? ""
            completion(false, message)
          } else {
            completion(false, "")
          }
        }
      }
    }
    
  }
  
}
