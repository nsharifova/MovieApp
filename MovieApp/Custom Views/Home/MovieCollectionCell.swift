//
//  MovieCollectionCell.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 28.11.24.
//

import UIKit


class MovieCollectionCell: UICollectionViewCell {
    static let identifier = "MovieCollectionCell"
    
    // Lazy initialization of the UIImageView
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure the cell with the image name
    func configure(with imageName: String) {
        imageView.image = UIImage(systemName: imageName)
    }
    
    // Setup the view and add imageView with constraints
    private func setupView() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func configure(data:Movies) {
        label.text = data.originalTitle
        if let posterPath = data.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/original/\(posterPath)") {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.image.image = UIImage(data: data)
                        }
                    }
                }
            }
       
    }
}
