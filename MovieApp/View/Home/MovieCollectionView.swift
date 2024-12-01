//
//  MovieCollectionView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 28.11.24.
//

import UIKit

class MovieCollectionView: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var movieData : [Movies]?
    var movieViewModel = MovieViewModel()
    weak var viewController: UIViewController?
    // Array of system image names
      let systemImages = ["car", "car.2", "bolt.car",
                          "house.lodge", "house.and.flag", "music.note.house",
                          "air.purifier", "air.conditioner.horizontal.fill"]
      
      // Lazy initialization of the UICollectionView
      private lazy var mainCollectionView: UICollectionView = {
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.scrollDirection = .vertical
          flowLayout.minimumLineSpacing = 0
          flowLayout.minimumInteritemSpacing = 0
          let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
          collectionView.register(MovieCollectionCell.self, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
          collectionView.delegate = self
          collectionView.dataSource = self
          collectionView.backgroundColor = .clear
          collectionView.showsVerticalScrollIndicator = false
          collectionView.translatesAutoresizingMaskIntoConstraints = false
          return collectionView
      }()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          setupView()
      }
      
      // Method to reload the collection view on the main thread
      func reloadCollectionView() {
          DispatchQueue.main.async { [weak self] in
              self?.mainCollectionView.reloadData()
          }
      }
      
      // Setup the view and add collection view with constraints
      private func setupView() {
          view.addSubview(mainCollectionView)
          NSLayoutConstraint.activate([
              mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              mainCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
              mainCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
              mainCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
          ])
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData?.count ?? 0
    }
    
    // Configure and return the cell for a given index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as! MovieCollectionCell
        guard let movies = movieData else {
            return cell
        }
        let item = movies[indexPath.row]
        cell.configure(data: item)
        return cell
      
    }
    
    // Return the size for the item at a given index path
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = mainCollectionView.frame.width / 3
        return CGSize(width: size, height: size)
    }
  }

  
