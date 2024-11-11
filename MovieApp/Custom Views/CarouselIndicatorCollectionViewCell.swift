//
//  CarouselIndicatorCollectionViewCell.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit

class CarouselIndicatorCollectionViewCell: UICollectionViewCell {
    var bulletView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bulletView = UIView()
        bulletView.translatesAutoresizingMaskIntoConstraints = false
        bulletView.layer.cornerRadius = 5  // Circular appearance
        contentView.addSubview(bulletView)
        
        NSLayoutConstraint.activate([
            bulletView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bulletView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bulletView.widthAnchor.constraint(equalToConstant: 10),
            bulletView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
