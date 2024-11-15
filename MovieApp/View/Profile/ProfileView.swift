//
//  ProfileView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit
import FirebaseAuth
class ProfileView: BaseViewController {
    let user = Auth.auth().currentUser
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(systemName: "person")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.textAlignment = .center
        return view
    }()
    let logoutButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Logout", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor.systemRed
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        return btn
    }()
    @objc func logoutAction(){
        do {
            try Auth.auth().signOut()
            
            if let window = UIApplication.shared.windows.first {
                let controller = LoginView()
                window.rootViewController = UINavigationController(rootViewController: controller)
                window.makeKeyAndVisible()
            }
            
        }
        catch {
            showErrorAlert(title: "Error", message: "Error")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(logoutButton)
        setUpConstraints()
        if user != nil {
            label.text = user?.email
        }
        
    }
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.heightAnchor.constraint(equalToConstant: 100),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            logoutButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            logoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            
            
            
        ])
    }
    
    
}
