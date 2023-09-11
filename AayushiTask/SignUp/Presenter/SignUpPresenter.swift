//
//  SignUpPresenter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation

class SignUpPresenter: SignUpViewToPresenterProtocol {
  
  // MARK: - Properties
  weak var view: SignUpPresenterToViewProtocol?
  var interactor: SignUpPresentorToInteractorProtocol?
  var router: SignUpPresenterToRouterProtocol?
    
  init(
      view: SignUpPresenterToViewProtocol,
      interactor: SignUpPresentorToInteractorProtocol,
      wireframe: SignUpPresenterToRouterProtocol
  ) {
      self.view = view
      self.interactor = interactor
      self.router = wireframe
  }

  // MARK: - Methods
  func signup(_ name: String, email: String, phone: String) {
    interactor?.registerUser(name, email: email, phone: phone, completion: { success, message in
      success ? self.view?.redirectToOTP(phone) : self.view?.showErrorMessage(message: message)
    })
  }
}

// MARK: - SignUpInteractorToPresenterProtocol
extension SignUpPresenter: SignUpInteractorToPresenterProtocol {
}
