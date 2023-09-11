//
//  OnboardRouter.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 10/09/23.
//

import Foundation
import UIKit

final class OnboardRouter: Router<OnboardViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: OnboardViewController.self)
        super.init(viewController: moduleViewController)

      let interactor: OnboardPresentorToInteractorProtocol = OnboardInteractor()
      let presenter = OnboardPresenter(view: moduleViewController, interactor: interactor, wireframe: self)

        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension OnboardRouter: OnboardPresenterToRouterProtocol {
    func navigateToLogin(_ view: OnboardPresenterToViewProtocol?) {
      if let sourceView = view as? UIViewController {
        sourceView.navigationController?.pushWireframe(LoginRouter())
      }
    }
  
  func navigateToSignUp(_ view: OnboardPresenterToViewProtocol?) {
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushWireframe(SignUpRouter())
    }
  }
}
