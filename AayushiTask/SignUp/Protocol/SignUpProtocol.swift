//
//  SignUpProtocol.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation

protocol SignUpPresenterToViewProtocol: AnyObject {
  func redirectToOTP(_ phone: String)
  func showErrorMessage(message: String)
}

protocol SignUpInteractorToPresenterProtocol: AnyObject {
}

protocol SignUpPresentorToInteractorProtocol: AnyObject {
  func registerUser(_ name: String, email: String, phone: String, completion: @escaping (Bool, String) -> Void)
}

protocol SignUpViewToPresenterProtocol: AnyObject {
    var view: SignUpPresenterToViewProtocol? { get set }
    var interactor: SignUpPresentorToInteractorProtocol? { get set }
    var router: SignUpPresenterToRouterProtocol? { get set }
    func signup(_ name: String, email: String, phone: String)
}

protocol SignUpPresenterToRouterProtocol: AnyObject {
  func navigateToOTP(_ phone: String)
}
