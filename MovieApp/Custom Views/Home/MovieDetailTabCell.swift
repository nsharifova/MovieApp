//
//  MovieDetailTabCell.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 13.11.24.
//

import UIKit

class MovieDetailTabCell: UICollectionViewCell {
    static let identifier = "TabCell"
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String, isSelected: Bool) {
        label.text = title
        contentView.backgroundColor = isSelected ? .systemBlue : .white
        label.textColor = isSelected ? .white : .black
    }
}

