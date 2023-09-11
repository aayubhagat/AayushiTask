//
//  SignUpInteractor.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation
import Alamofire

class SignUpInteractor: SignUpPresentorToInteractorProtocol {
  
  // MARK: - Methods
  
  func registerUser(_ name: String, email: String, phone: String, completion: @escaping (Bool, String) -> Void) {
    let parameters = ["full_name": name, "phone": "+91\(phone)", "email": email]
    AF.request("https://api.staging.speedyy.com/user/customer/auth/register/otp", method: .post, parameters: parameters).response { response in
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
