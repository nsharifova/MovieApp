//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 11.11.24.
//

import UIKit

class MovieDetailsView: UIViewController {
    var id: Int?
    private let tabTitles = ["Details", "Trailer", "Cast"]
    private var collectionView: UICollectionView!
    private var selectedTabIndex = 0
    var movieDetail: MovieDetail?

    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.textAlignment = .left
        return view
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(image)
        setupCollectionView()
        setUpConstraints()

        if let data = movieDetail {
            label.text = data.belongsToCollection?.name
        }
        if let posterPath = movieDetail?.posterPath, let url = URL(string: "https://image.tmdb.org/t/p/original/\(posterPath)") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: data)
                    }
                }
            }
        }
    }

    private func setupCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 3.0), heightDimension: .absolute(44))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            } else {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.register(MovieDetailTabCell.self, forCellWithReuseIdentifier: MovieDetailTabCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ContentCell")
    }

    func setUpConstraints(){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                   collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                   collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                   collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
               
            
        ])
    }
}

extension MovieDetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 2 
       }
       
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return section == 0 ? tabTitles.count : 1
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           if indexPath.section == 0 {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailTabCell.identifier, for: indexPath) as! MovieDetailTabCell
               cell.configure(with: tabTitles[indexPath.item], isSelected: indexPath.item == selectedTabIndex)
               return cell
           } else {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath)
               configureContentCell(cell, forTabIndex: selectedTabIndex)
               return cell
           }
       }
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if indexPath.section == 0 {
               selectedTabIndex = indexPath.item
               collectionView.reloadSections(IndexSet(integer: 0))
               collectionView.reloadSections(IndexSet(integer: 1))
           }
       }
       
       func configureContentCell(_ cell: UICollectionViewCell, forTabIndex tabIndex: Int) {
           switch tabIndex {
           case 0:
               if let aboutFilm = movieDetail?.overview {
                   let label = UILabel()
                   label.text = aboutFilm
                   label.numberOfLines = 0
                   label.translatesAutoresizingMaskIntoConstraints = false
                   cell.contentView.addSubview(label)
                   NSLayoutConstraint.activate([
                       label.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                       label.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                       label.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
                   ])
               }
           case 1:
               if let cast = movieDetail?.originCountry {
                   let castLabel = UILabel()
                   castLabel.text = "Cast: \(cast.joined(separator: ", "))"
                   castLabel.numberOfLines = 0
                   castLabel.translatesAutoresizingMaskIntoConstraints = false
                   cell.contentView.addSubview(castLabel)
                   NSLayoutConstraint.activate([
                       castLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                       castLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                       castLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
                   ])
               }
           case 2:
               if let reviews = movieDetail?.originCountry {
                   let reviewsLabel = UILabel()
                   reviewsLabel.text = "Reviews: \(reviews.joined(separator: ", "))"
                   reviewsLabel.numberOfLines = 0
                   reviewsLabel.translatesAutoresizingMaskIntoConstraints = false
                   cell.contentView.addSubview(reviewsLabel)
                   NSLayoutConstraint.activate([
                       reviewsLabel.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                       reviewsLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                       reviewsLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
                   ])
               }
           default:
               break
           }
       }
}
