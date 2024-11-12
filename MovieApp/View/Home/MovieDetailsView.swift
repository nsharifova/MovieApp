//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 11.11.24.
//

import UIKit

class MovieDetailsView: UIViewController {
    var id : Int?
    var movieDetail: MovieDetail?
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.textAlignment = .left
        return view
    }()
//    let image: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 16
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        setUpConstraints()
        if let data = movieDetail {
            label.text = data.belongsToCollection.name
        }
    
    }
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    
}
