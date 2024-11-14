//
//  FavoritesView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit


class FavoritesView: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var movieViewModel = MovieViewModel()

    private let mainTitle = CustomLabel(text: "Favorites", font: UIFont.boldSystemFont(ofSize: 24))
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(FavoritesCollectionCell.self, forCellWithReuseIdentifier: "FavoritesCollectionCell")
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainTitle)
        view.addSubview(collectionView)
        setUpConstraints()
        showActivityIndicator(with: CGSize(width: 80, height: 80), color: UIColor.blue)
        self.view.bringSubviewToFront(activityIndicator)
        
        movieViewModel.getMoviesByCategory()
        movieViewModel.success = {
            self.collectionView.reloadData()
            self.hideActivityIndicator()
        }
        movieViewModel.error = { error in
            print(error)
            
        }
        
        
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
           
            
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor,constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 24),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -24),
            
            
        ])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionCell", for: indexPath) as! FavoritesCollectionCell
//        let item = movieViewModel.allMovies[indexPath.row]
//        cell.configure(data:item)
//        cell.viewController = self
//        cell.movieData = item.movies
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
    
    
    
}
