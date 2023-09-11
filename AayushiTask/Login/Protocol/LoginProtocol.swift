//
//  LoginProtocol.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation

protocol LoginPresenterToViewProtocol: AnyObject {
  func redirectToOTP(_ phone: String)
  func showErrorMessage(message: String)
}

protocol LoginInteractorToPresenterProtocol: AnyObject {
}

protocol LoginPresentorToInteractorProtocol: AnyObject {
  func login(_ phone: String, completion: @escaping (Bool, String) -> Void)
}

protocol LoginViewToPresenterProtocol: AnyObject {
    var view: LoginPresenterToViewProtocol? { get set }
    var interactor: LoginPresentorToInteractorProtocol? { get set }
    var router: LoginPresenterToRouterProtocol? { get set }
    func login(_ phone: String)
}

protocol LoginPresenterToRouterProtocol: AnyObject {
  func navigateToOTP(_ phone: String)
}
