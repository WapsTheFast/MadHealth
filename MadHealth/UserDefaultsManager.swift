//
//  UserDefaultsManager.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 21.11.22.
//

import Foundation

class UserDefaultsManager{
    
    static let storage = UserDefaultsManager()
    
    enum Data : String{
        case onBoardingIsShowed = "onBoardingIsShowed"
    }
    
    func getBool(data : Data)->Bool{
        UserDefaults.standard.bool(forKey: data.rawValue)
    }
    
    func setBool(value : Bool , data : Data){
        UserDefaults.standard.set(value, forKey: data.rawValue)
    }
}
