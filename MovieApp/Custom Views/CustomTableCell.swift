//
//  CustomTableCell.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit

class CustomTableCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
   
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView (
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.register(CustomImageCollectionViewCell.self, forCellWithReuseIdentifier: "CustomImageCollectionViewCell")
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomImageCollectionViewCell",for: indexPath) as! CustomImageCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout,size) -> UICollectionViewTransitionLayout {
        <#code#>
    }
}
