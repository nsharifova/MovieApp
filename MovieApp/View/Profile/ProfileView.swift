//
//  ProfileView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit

class ProfileView: UIViewController {
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
        view.text = "Nurluay Sharifova"
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(image)
        view.addSubview(label)
        setUpConstraints()

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

            
            
        ])
    }


}
