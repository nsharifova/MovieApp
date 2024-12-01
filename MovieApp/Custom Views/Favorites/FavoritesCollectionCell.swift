//
//  FavoritesCollectionCell.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 13.11.24.
//

import UIKit

class FavoritesCollectionCell: UICollectionViewCell {
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.image = UIImage(named: "Image1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "Venom"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.textAlignment = .left
        return view
    }()
    private let dateIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "calendar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "25 Oct 2024"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ticketIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "ticket"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$12.99"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let ratingIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.5"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "clock"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "139 minutes"
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateIcon, dateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ticketIcon, priceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ratingIcon, ratingLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var timeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeIcon, timeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, dateStackView, priceStackView,ratingStackView,timeStackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(verticalStackView)
        contentView.addSubview(image)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 120),
            image.widthAnchor.constraint(equalToConstant: 95),
            
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            
            
            
            
        ])
    }
    
    func configure(data:FavoriteMovie) {
        
        label.text = data.originalTitle
        dateLabel.text = data.releaseDate
        ratingLabel.text = "7.9"
        priceLabel.text = "4"
        let posterPath = data.posterPath
        if let url = URL(string: "https://image.tmdb.org/t/p/original/\(String(describing: posterPath))") {
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
