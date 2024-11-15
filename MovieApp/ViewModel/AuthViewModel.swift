//
//  AuthViewModel.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 14.11.24.
//

import Foundation
import FirebaseAuth
import UIKit

class AuthViewModel {
    func registerAction(email: String, password: String, viewController: UIViewController) {
        Auth.auth().createUser(withEmail: email, password: password) { authData, error in
            if let error = error {
                showAlert(on: viewController, title: "Error", message: error.localizedDescription)
            } else {
                let controller = LoginView()
                viewController.navigationController?.pushViewController(controller, animated: true)
                
            }
        }
    }
    
    func signInAction(email: String, password: String, viewController: UIViewController) {
        Auth.auth().signIn(withEmail: email, password: password) { signData, error in
            if let error = error {
                showAlert(on: viewController, title: "Error", message: error.localizedDescription)
            } else {
                //                let controller = ViewController()
                //                viewController.navigationController?.pushViewController(controller, animated: true)
                if let window = UIApplication.shared.windows.first {
                    let controller = ViewController()
                    window.rootViewController = UINavigationController(rootViewController: controller)
                    window.makeKeyAndVisible()
                }
            }
        }
    }
    
}
