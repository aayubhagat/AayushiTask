//
//  VerifyOTPPresenter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation

class VerifyOTPPresenter: VerifyOTPViewToPresenterProtocol {
  
  // MARK: - Properties
  weak var view: VerifyOTPPresenterToViewProtocol?
  var interactor: VerifyOTPPresentorToInteractorProtocol?
  var router: VerifyOTPPresenterToRouterProtocol?
  
  init(
      view: VerifyOTPPresenterToViewProtocol,
      interactor: VerifyOTPPresentorToInteractorProtocol,
      wireframe: VerifyOTPPresenterToRouterProtocol
  ) {
      self.view = view
      self.interactor = interactor
      self.router = wireframe
  }

  // MARK: - Methods
  func verifyOTP(_ code: String, phone: String, type: OTPType) {
    interactor?.verifyOTP(code, phone: phone, type: type, completion: { success, message in
      success ? (type == .signup ? self.view?.redirectToLogin() : self.view?.showMessage(message: "Verfication successfull")) : self.view?.showMessage(message: message)
    })
  }
}

// MARK: - SignUpInteractorToPresenterProtocol
extension VerifyOTPPresenter: VerifyOTPInteractorToPresenterProtocol {
}
