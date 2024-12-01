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
     let mainTitle = CustomLabel(text: "", font: UIFont.boldSystemFont(ofSize: 24))
    
    
            private lazy var mainCollectionView: UICollectionView = {
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.scrollDirection = .vertical
          flowLayout.minimumLineSpacing = 24
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
      
      func reloadCollectionView() {
          DispatchQueue.main.async { [weak self] in
              self?.mainCollectionView.reloadData()
          }
      }
      
      private func setupView() {
          view.addSubview(mainTitle)
          view.addSubview(mainCollectionView)
          NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            mainTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
              mainCollectionView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor,constant: 24),
              mainCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
              mainCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
              mainCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
          ])
      }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as! MovieCollectionCell
        guard let movies = movieData else {
            return cell
        }
        let item = movies[indexPath.row]
        cell.configure(data: item)
        return cell
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = mainCollectionView.frame.width / 2
        return CGSize(width: size, height: size)
    }
  }

  
