//
//  OnboardProtocols.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import Foundation
import UIKit

protocol OnboardPresenterToViewProtocol: AnyObject {
    func showOnboard()
}

protocol OnboardInteractorToPresenterProtocol: AnyObject {
    func onboardFetched()
}

protocol OnboardPresentorToInteractorProtocol: AnyObject {
    var presenter: OnboardInteractorToPresenterProtocol? { get set }
    var datasource: [OnboardModel]? { get }
    
    func fetchOnboard()
}

protocol OnboardViewToPresenterProtocol: AnyObject {
    var view: OnboardPresenterToViewProtocol? { get set }
    var interactor: OnboardPresentorToInteractorProtocol? { get set }
    var router: OnboardPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getOnboardListCount() -> Int?
    func getOnboard(index: Int) -> OnboardModel?
}

protocol OnboardPresenterToRouterProtocol: AnyObject {
  func navigateToLogin(_ view: OnboardPresenterToViewProtocol?)
  func navigateToSignUp(_ view: OnboardPresenterToViewProtocol?)
}
