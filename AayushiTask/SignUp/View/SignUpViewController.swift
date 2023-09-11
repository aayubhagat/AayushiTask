//
//  SignUpViewController.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import UIKit

class SignUpViewController: UIViewController {
  
  // MARK: - IBOutlet properties
  
  @IBOutlet weak private var nameTextField: UITextField!
  @IBOutlet weak private var emailTextField: UITextField!
  @IBOutlet weak private var phoneNumberTextField: UITextField!
  @IBOutlet weak private var proceedButon: UIButton!
  @IBOutlet weak private var phoneNumberView: UIView!

  // MARK: - Instance properties
  
  var presenter: SignUpViewToPresenterProtocol?
  
  // MARK: - Overridden properties
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
  // MARK: - Private helper methods
  
  private func initialSetup() {
    configureUI()
  }
  
  private func configureUI() {
    [proceedButon].forEach({ $0?.layer.cornerRadius = 10.0 })
    [phoneNumberView].forEach({ $0?.layer.borderColor = UIColor.black.cgColor })
    [phoneNumberView].forEach({ $0?.layer.borderWidth = 0.8 })
  }
  
  func showAlert(_ message: String) {
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }

  @IBAction func registerButtonTapped(_ sender: UIButton) {
    presenter?.signup(nameTextField.text!, email: emailTextField.text!, phone: phoneNumberTextField.text!)
  }
  
  @IBAction func backButtonTapped(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }

}

// MARK: - SignUpPresenterToViewProtocol
extension SignUpViewController: SignUpPresenterToViewProtocol {
  
  func redirectToOTP(_ phone: String) {
    presenter?.router?.navigateToOTP(phone)
  }
  
  func showErrorMessage(message: String) {
    showAlert(message)
  }
}
