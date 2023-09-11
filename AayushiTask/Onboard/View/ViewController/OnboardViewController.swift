//
//  OnboardViewController.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 10/09/23.
//

import UIKit

class OnboardViewController: UIViewController {
  
  // MARK: - IBOutlet properties
  
  @IBOutlet weak private var onboardCollection: UICollectionView!{
    didSet {
      onboardCollection.delegate = self
      onboardCollection.dataSource = self
    }
  }
  @IBOutlet weak private var pageControl: UIPageControl!
  @IBOutlet weak private var loginButton: UIButton!
  @IBOutlet weak private var registerButton: UIButton!
  
  // MARK: - Instance properties
  
  var presenter: OnboardViewToPresenterProtocol?
  
  // MARK: - Private Instance properties
  
  private var currentIndex = 0
  
  // MARK: - Overridden properties
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
  }
  
  // MARK: - Private helper methods
  
  private func initialSetup() {
    configureUI()
    presenter?.updateView()
  }
  
  private func configureUI() {
    [loginButton, registerButton].forEach({ $0?.layer.cornerRadius = 10.0 })
    [loginButton].forEach({ $0?.layer.borderColor = UIColor.black.cgColor })
    [loginButton].forEach({ $0?.layer.borderWidth = 0.8 })
  }
  
  private func setupLayout() {
    pageControl.numberOfPages = presenter?.getOnboardListCount() ?? 0
  }
  
  @IBAction func loginButtonTapped(_ sender: UIButton) {
    presenter?.router?.navigateToLogin(presenter?.view)
  }
  
  @IBAction func registerButtonTapped(_ sender: UIButton) {
    presenter?.router?.navigateToSignUp(presenter?.view)
  }
  
}

extension OnboardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    presenter?.getOnboardListCount() ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let onboardCell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardCell.reuseIdentifier, for: indexPath) as? OnboardCell else { return UICollectionViewCell() }
    let row = indexPath.row
    guard let datasource = presenter?.getOnboard(index: row) else {
      return onboardCell
    }
    onboardCell.configure(datasource)
    return onboardCell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: onboardCollection.bounds.width, height: onboardCollection.bounds.height)
  }
}

// MARK: - ScrollViewDelegate

extension OnboardViewController {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let scrollIndex = round(scrollView.contentOffset.x / view.frame.width)
    self.currentIndex = Int(scrollIndex)
    self.pageControl.currentPage = self.currentIndex
  }
}

// MARK: - OnboardPresenterToViewProtocol
extension OnboardViewController: OnboardPresenterToViewProtocol {
  
  func showOnboard() {
    setupLayout()
    onboardCollection.reloadData()
  }
}
