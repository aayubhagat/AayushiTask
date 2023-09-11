//
//  OnboardPresenter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 10/09/23.
//

import Foundation

class OnboardPresenter: OnboardViewToPresenterProtocol {
  
  // MARK: - Properties
  weak var view: OnboardPresenterToViewProtocol?
  var interactor: OnboardPresentorToInteractorProtocol?
  var router: OnboardPresenterToRouterProtocol?
    
  init(
      view: OnboardPresenterToViewProtocol,
      interactor: OnboardPresentorToInteractorProtocol,
      wireframe: OnboardPresenterToRouterProtocol
  ) {
      self.view = view
      self.interactor = interactor
      self.router = wireframe
  }

  // MARK: - Methods
  func updateView() {
    interactor?.fetchOnboard()
  }
  
  func getOnboardListCount() -> Int? {
    return interactor?.datasource?.count
  }
  
  func getOnboard(index: Int) -> OnboardModel? {
    return interactor?.datasource?[index]
  }
}

// MARK: - OnboardInteractorToPresenterProtocol
extension OnboardPresenter: OnboardInteractorToPresenterProtocol {
  
  func onboardFetched() {
        view?.showOnboard()
    }
}

