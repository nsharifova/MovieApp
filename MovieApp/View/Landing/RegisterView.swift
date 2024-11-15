//
//  LoginView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 14.11.24.
//

import UIKit
import FirebaseAuth

class RegisterView: BaseViewController {
    let authViewModel = AuthViewModel()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LoginLogo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let emailField : UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .none
        email.keyboardType = .emailAddress
        email.translatesAutoresizingMaskIntoConstraints = false
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 44 - 1, width: 250, height: 1)
        bottomLine.backgroundColor = UIColor.systemBlue.cgColor
        email.layer.addSublayer(bottomLine)
        return email
    }()
    
    let passwordField : UITextField = {
        let password = UITextField()
        password.borderStyle = .none
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 44 - 1, width: 250, height: 1)
        bottomLine.backgroundColor = UIColor.systemBlue.cgColor
        password.layer.addSublayer(bottomLine)
        return password
    }()
    let togglePasswordVisibilityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.tintColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    
    
    let signUpButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.systemBlue
        btn.layer.cornerRadius = 8
        btn.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    @objc func togglePasswordVisibility() {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
        togglePasswordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    
    @objc func signUpAction() {
        if (emailField.text != nil && emailField.text != nil) {
            authViewModel.registerAction(email: emailField.text ?? "", password: passwordField.text ?? "", viewController: self)
        }
        else {
            self.showErrorAlert(title: "Error", message: "Please fill the fields")
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupViews()
        setupConstraints()
        
    }
    
    func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.white.cgColor,
            UIColor.white.cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signUpButton)
        view.addSubview(togglePasswordVisibilityButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 250),
            emailField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 250),
            passwordField.heightAnchor.constraint(equalToConstant: 44),
            
            togglePasswordVisibilityButton.centerYAnchor.constraint(equalTo: passwordField.centerYAnchor),
            togglePasswordVisibilityButton.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor, constant: -10),
            togglePasswordVisibilityButton.widthAnchor.constraint(equalToConstant: 24),
            togglePasswordVisibilityButton.heightAnchor.constraint(equalToConstant: 24),
            
            signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 250),
            signUpButton.heightAnchor.constraint(equalToConstant: 44),
            
            
        ])
    }
}
