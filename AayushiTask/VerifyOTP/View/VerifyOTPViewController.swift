//
//  VerifyOTPViewController.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 11/09/23.
//

import UIKit

class VerifyOTPViewController: UIViewController {
  
  // MARK: - IBOutlet properties
  
  @IBOutlet weak var code1: UITextField!
  @IBOutlet weak var code2: UITextField!
  @IBOutlet weak var code3: UITextField!
  @IBOutlet weak var code4: UITextField!
  @IBOutlet weak var code5: UITextField!
  @IBOutlet weak private var phoneLabel: UILabel!
  @IBOutlet weak private var proceedButon: UIButton!

  // MARK: - Instance properties
  
  var presenter: VerifyOTPViewToPresenterProtocol?
  var phoneNumber: String?
  var otpType: OTPType = .signup
  
  // MARK: - Overridden properties
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  // MARK: - Private helper methods
  
  private func initialSetup() {
    configureUI()
  }
  
  private func configureUI() {
    phoneLabel.text = "+91-\(phoneNumber ?? "")"
    [code1, code2, code3, code4, code5].forEach({ $0?.layer.cornerRadius = 10.0 })
    [code1, code2, code3, code4, code5].forEach({ $0?.layer.borderColor = UIColor.lightGray.cgColor })
    [code1, code2, code3, code4, code5].forEach({ $0?.layer.borderWidth = 0.8 })
  }
  
  func showAlert(_ message: String) {
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }

  @IBAction func continueButtonTapped(_ sender: UIButton) {
    let code = [code1, code2, code3, code4, code5].map({$0?.text}).compactMap({$0}).reduce("", { $0 + $1 })
    presenter?.verifyOTP(code, phone: phoneNumber ?? "", type: otpType)
  }
  
  @IBAction func backButtonTapped(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
}

extension VerifyOTPViewController: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.text = ""
  }
  
  @IBAction func textFieldDidChange(textField: UITextField) {
    if let string = textField.text, string.count >= 1 {
      switch textField {
      case code1:
        code2.becomeFirstResponder()
      case code2:
        code3.becomeFirstResponder()
      case code3:
        code4.becomeFirstResponder()
      case code4:
        code5.becomeFirstResponder()
      case code5:
        code5.resignFirstResponder()
      default:
        break
      }
    }
  }
  
  @objc func keyboardInputShouldDelete(_ textField: UITextField) -> Bool {
    
    let shouldDelete: Bool = true
    
    if textField.text?.count == 0 && (textField.text == "") {
      let tagValue: Int = textField.tag - 1
      let txtField: UITextField? = (view.viewWithTag(tagValue) as? UITextField)
      txtField?.becomeFirstResponder()
    }
    
    return shouldDelete
  }
}

// MARK: - VerifyOTPPresenterToViewProtocol
extension VerifyOTPViewController: VerifyOTPPresenterToViewProtocol {
  func redirectToLogin() {
    presenter?.router?.navigateToLogin()
  }
  
  func showMessage(message: String) {
    showAlert(message)
  }
}
