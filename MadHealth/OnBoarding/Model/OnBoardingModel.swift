//
//  OnBoardingModel.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 18.11.22.
//

import Foundation
import UIKit

protocol OnBoardingSlideProtocol{
    var image : UIImage {get set}
    var title : String {get set}
    var description : String {get set}
}

struct OnBoardingSlide : OnBoardingSlideProtocol{
    var image: UIImage
    var title: String
    var description: String
    
    
}
