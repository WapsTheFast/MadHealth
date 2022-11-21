//
//  OnBoardingCollectionViewCell.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 18.11.22.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTextLabel: UILabel!
    
    func setupCell(_ slide: OnBoardingSlideProtocol){
        slideTitleLabel.text = slide.title
        slideTextLabel.text = slide.description
        slideImageView.image = slide.image
    }
    
}
