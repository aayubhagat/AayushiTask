//
//  SignUpRouter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation
import UIKit

final class SignUpRouter: Router<SignUpViewController> {
  
  // MARK: - Private properties -
  
  private let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
  // MARK: - Module setup -
  
  init() {
    let moduleViewController = storyboard.instantiateViewController(ofType: SignUpViewController.self)
    super.init(viewController: moduleViewController)
    
    let interactor: SignUpPresentorToInteractorProtocol = SignUpInteractor()
    let presenter = SignUpPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
    
    moduleViewController.presenter = presenter
  }
  
}

// MARK: - Extensions -

extension SignUpRouter: SignUpPresenterToRouterProtocol {
  func navigateToOTP(_ phoneNumber: String) {
    navigationController?.pushWireframe(VerifyOTPRouter(phoneNumber, type: .signup))
  }
}
