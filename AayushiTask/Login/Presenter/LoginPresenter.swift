//
//  LoginPresenter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation

class LoginPresenter: LoginViewToPresenterProtocol {
  
  // MARK: - Properties
  weak var view: LoginPresenterToViewProtocol?
  var interactor: LoginPresentorToInteractorProtocol?
  var router: LoginPresenterToRouterProtocol?
    
  init(
      view: LoginPresenterToViewProtocol,
      interactor: LoginPresentorToInteractorProtocol,
      wireframe: LoginPresenterToRouterProtocol
  ) {
      self.view = view
      self.interactor = interactor
      self.router = wireframe
  }

  // MARK: - Methods
  func login(_ phone: String) {
    interactor?.login(phone, completion: { success, message in
      success ? self.view?.redirectToOTP(phone) : self.view?.showErrorMessage(message: message)
    })
  }
}

// MARK: - LoginInteractorToPresenterProtocol
extension LoginPresenter: LoginInteractorToPresenterProtocol {
}
