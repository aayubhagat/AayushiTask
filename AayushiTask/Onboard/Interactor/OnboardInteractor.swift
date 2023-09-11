//
//  OnboardInteractor.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 10/09/23.
//

import Foundation

class OnboardInteractor: OnboardPresentorToInteractorProtocol {
  
  // MARK: - Properties
  weak var presenter: OnboardInteractorToPresenterProtocol?
  var datasource: [OnboardModel]?
  
  // MARK: - Methods
  func fetchOnboard() {
    datasource = [OnboardModel(image: #imageLiteral(resourceName: "ic_walkthrough"), title: "Simple, Fast and Convenient", description: "Get everything delivered in 10 minutes."),
                  OnboardModel(image: #imageLiteral(resourceName: "ic_walkthrough"), title: "Simple, Fast and Convenient", description: "Get everything delivered in 10 minutes."),
                  OnboardModel(image: #imageLiteral(resourceName: "ic_walkthrough"), title: "Simple, Fast and Convenient", description: "Get everything delivered in 10 minutes.")]
    self.presenter?.onboardFetched()
  }

}
