//
//  LoginPresenter.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 21.11.22.
//

import Foundation

protocol LoginPresenterProtocol{
    func auth(email : String, password : String)
    func sendCode(email : String)
    func checkCode(code : String)
}

class LoginPresenter : LoginPresenterProtocol{
    
    func auth(email: String, password: String) {
        
    }
    
    func sendCode(email: String) {
        
    }
    
    func checkCode(code: String) {
        
    }
    
    
    weak var delegate : LoginViewDelegateProtocol?
    
    var passwordToggle = true
    
    func togglePassword(){
        passwordToggle.toggle()
    }
}
