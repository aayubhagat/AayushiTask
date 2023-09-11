//
//  LoginRouter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation
import UIKit

final class LoginRouter: Router<LoginViewController> {
  
  // MARK: - Private properties -
  
  private let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
  // MARK: - Module setup -
  
  init() {
    let moduleViewController = storyboard.instantiateViewController(ofType: LoginViewController.self)
    super.init(viewController: moduleViewController)
    
    let interactor: LoginPresentorToInteractorProtocol = LoginInteractor()
    let presenter = LoginPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
    
    moduleViewController.presenter = presenter
  }
  
}

// MARK: - Extensions -

extension LoginRouter: LoginPresenterToRouterProtocol {
  func navigateToOTP(_ phoneNumber: String) {
    navigationController?.pushWireframe(VerifyOTPRouter(phoneNumber, type: .login))
  }
}
