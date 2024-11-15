//
//  LoginView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 14.11.24.
//

import UIKit
import FirebaseAuth

class LoginView: UIViewController {
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
    
    let signInButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign in", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.systemBlue
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return btn
    }()
    
    let signUpLabel : UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let signUpButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign up", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(goResgister), for: .touchUpInside)
        return btn
    }()
    @objc func togglePasswordVisibility() {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye.fill" : "eye.slash.fill"
        togglePasswordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @objc func signInAction(){
        authViewModel.signInAction(email: emailField.text ?? "", password: passwordField.text ?? "", viewController: self)
    }
    @objc func goResgister(){
        let controller = RegisterView()
        navigationController?.pushViewController(controller, animated: true)
        
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
        view.addSubview(signInButton)
        view.addSubview(signUpLabel)
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
            
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 250),
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            
            signUpLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 4),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
