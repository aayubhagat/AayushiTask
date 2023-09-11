//
//  VerifyOTPProtocol.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation

protocol VerifyOTPPresenterToViewProtocol: AnyObject {
    func redirectToLogin()
  func showMessage(message: String)
}

protocol VerifyOTPInteractorToPresenterProtocol: AnyObject {
}

protocol VerifyOTPPresentorToInteractorProtocol: AnyObject {
  func verifyOTP(_ code: String, phone: String, type: OTPType, completion: @escaping (Bool, String) -> Void)
}

protocol VerifyOTPViewToPresenterProtocol: AnyObject {
    var view: VerifyOTPPresenterToViewProtocol? { get set }
    var interactor: VerifyOTPPresentorToInteractorProtocol? { get set }
    var router: VerifyOTPPresenterToRouterProtocol? { get set }
  func verifyOTP(_ code: String, phone: String, type: OTPType)
}

protocol VerifyOTPPresenterToRouterProtocol: AnyObject {
  func navigateToLogin()
}
