//
//  FavoritesView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit
import FirebaseAuth


class FavoritesView: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var movieViewModel = MovieViewModel()
    let userId = Auth.auth().currentUser?.uid
    weak var viewController: UIViewController?


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
        self.view.bringSubviewToFront(emptyStateLabel)

        setUpConstraints()
        showActivityIndicator(with: CGSize(width: 80, height: 80), color: UIColor.blue)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshItems), name: NSNotification.Name("AddedFavorites"), object: nil)
        self.view.bringSubviewToFront(activityIndicator)
        
        movieViewModel.getFavoriteMovies(userId: userId ?? "")
        movieViewModel.success = {
            self.collectionView.reloadData()
            self.hideActivityIndicator()
            let isEmpty = self.movieViewModel.favoriteMovies.isEmpty
                self.updateEmptyStateLabel(
                    isHidden: !isEmpty,
                    message: isEmpty ? "You don't have any data yet!" : nil
                )
            print("Favoritesss : \(self.movieViewModel.favoriteMovies)")

        
        }
        movieViewModel.error = { error in
            self.hideActivityIndicator()
            self.showErrorAlert(title: "Error", message: error)

        }

        
        
    }
    @objc func refreshItems() {
        movieViewModel.getFavoriteMovies(userId: userId ?? "")
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
        return movieViewModel.favoriteMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionCell", for: indexPath) as! FavoritesCollectionCell
        let item = movieViewModel.favoriteMovies[indexPath.row]
        cell.configure(data:item)
//        cell.viewController = self
//        cell.movieData = item.movies
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = MovieDetailsView()
//        let item = movieViewModel.favoriteMovies[indexPath.row]
//        movieViewModel.getMovieDetailInfo(id: item.id) { result in
//            switch result {
//            case .success:
//                controller.movieDetail = item
//                self.navigationController?.pushViewController(controller, animated: true)
//            case .failure(let error):
//                self.showErrorAlert(title: "Error", message: error.localizedDescription)
//            }
//        }
//    }

    
    
}
