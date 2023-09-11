//
//  LoginInteractor.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation
import Alamofire

class LoginInteractor: LoginPresentorToInteractorProtocol {
  
  // MARK: - Methods
  
  func login(_ phone: String, completion: @escaping (Bool, String) -> Void) {
    let parameters = ["phone": "+91\(phone)"]
    AF.request("https://api.staging.speedyy.com/user/customer/auth/login/otp", method: .post, parameters: parameters).response { response in
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
