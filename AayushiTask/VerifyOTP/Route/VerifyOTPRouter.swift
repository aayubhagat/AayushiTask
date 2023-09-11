//
//  VerifyOTPRouter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation
import UIKit

final class VerifyOTPRouter: Router<VerifyOTPViewController> {
  
  // MARK: - Private properties -
  
  private let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
  // MARK: - Module setup -
  
  init(_ phoneNumber: String, type: OTPType) {
    let moduleViewController = storyboard.instantiateViewController(ofType: VerifyOTPViewController.self)
    super.init(viewController: moduleViewController)
    
    let interactor: VerifyOTPPresentorToInteractorProtocol = VerifyOTPInteractor()
    let presenter = VerifyOTPPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
    
    moduleViewController.presenter = presenter
    moduleViewController.phoneNumber = phoneNumber
    moduleViewController.otpType = type
  }
  
}

// MARK: - Extensions -

extension VerifyOTPRouter: VerifyOTPPresenterToRouterProtocol {
  func navigateToLogin() {
    navigationController?.popToRootViewController(animated: true)
  }
}
