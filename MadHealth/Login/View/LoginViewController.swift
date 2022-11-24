//
//  LoginViewController.swift
//  MadHealth
//
//  Created by Андрэй Целігузаў on 21.11.22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signViaCodeButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var signInButtonBottomConstraint: NSLayoutConstraint!
    
    private let loginPresenter = LoginPresenter()
    private var keyboardHelper : KeyboardHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension LoginViewController{
    
    func configure(){
        loginPresenter.delegate = self
        keyboardConfigure()
        passwordTextField.isSecureTextEntry = loginPresenter.passwordToggle
    }
    
    func keyboardConfigure(){
        closeKeyboard()
        keyboardHelper = KeyboardHelper{[weak self] (animation, keyboardSize, duration) in
            UIView.animate(withDuration: duration){[weak self] in
                guard let self = self else { return }
                switch animation{
                case .willShow:
                    self.signInButtonBottomConstraint.constant = keyboardSize.height
                case .willHide:
                    self.signInButtonBottomConstraint.constant = 118
                    
                }
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func closeKeyboard(){
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
}

extension LoginViewController : LoginViewDelegateProtocol{
    func openMainMenu() {
        self.present(UIAlertController(title: "SignIn?", message: "u press me!", preferredStyle: .actionSheet), animated: true)
    }
    
    
}

extension LoginViewController{
    
    @IBAction func editingTextFields(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == ""{
            signInButton.isEnabled = false
        }else if emailTextField.text != "" && passwordTextField.text != ""{
            signInButton.isEnabled = true
        }
    }
    
    @IBAction func switchPasswordSecure(){
        self.loginPresenter.togglePassword()
        self.passwordTextField.isSecureTextEntry = self.loginPresenter.passwordToggle
        self.showPasswordButton.tintColor = self.loginPresenter.passwordToggle ? #colorLiteral(red: 0.6274509804, green: 0.5843137255, blue: 0.7568627451, alpha: 1) : #colorLiteral(red: 0.3349039555, green: 0.2513573468, blue: 0.5784834027, alpha: 1)
    }
    
    @IBAction func signInButtonAction(_ sender: Any?){
        openMainMenu()
    }
}
