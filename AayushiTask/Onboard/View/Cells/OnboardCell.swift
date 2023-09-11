//
//  OnboardCell.swift
//  AayushiTask
//
//  Created by Aayushi Bhagat on 10/09/23.
//

import UIKit

class OnboardCell: UICollectionViewCell {
  
  static let reuseIdentifier = "OnboardCell"
  
  // MARK: - IBOutlet properties
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  // MARK: - Helper methods
  
  func configure(_ onboard: OnboardModel) {
    titleLabel.text = onboard.title
//    imageView.image = onboard.image
    descriptionLabel.text = onboard.description
  }
}
