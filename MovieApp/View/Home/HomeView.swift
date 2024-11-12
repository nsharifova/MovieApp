//
//  HomeView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//
import UIKit

class HomeView: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var movieViewModel = MovieViewModel()
    private let menuIcon = CustomButton(imageName: "MenuIcon", target: HomeView.self)
    private let searchIcon = CustomButton(imageName: "SearchIcon", target: HomeView.self)
    private let mainTitle = CustomLabel(text: "Movies", font: UIFont.boldSystemFont(ofSize: 24))
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeCarouselCell.self, forCellWithReuseIdentifier: "HomeCarouselCell")
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showActivityIndicator()
        view.addSubview(menuIcon)
        view.addSubview(searchIcon)
        view.addSubview(mainTitle)
        view.addSubview(collectionView)
        setUpConstraints()
        movieViewModel.getMoviesByCategory()
        movieViewModel.success = {
            self.collectionView.reloadData()
        }
        movieViewModel.error = { error in
            print(error)
            
        }
        
        
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            menuIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            menuIcon.widthAnchor.constraint(equalToConstant: 24),
            menuIcon.heightAnchor.constraint(equalToConstant: 24),
            
            searchIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchIcon.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            searchIcon.widthAnchor.constraint(equalToConstant: 24),
            searchIcon.heightAnchor.constraint(equalToConstant: 24),
            
            mainTitle.topAnchor.constraint(equalTo: menuIcon.bottomAnchor, constant: 24),
            mainTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            collectionView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor,constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 24),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -24),
            
            
        ])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieViewModel.allMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCarouselCell", for: indexPath) as! HomeCarouselCell
        let item = movieViewModel.allMovies[indexPath.row]
        cell.configure(data:item)
        cell.movieData = item.movies
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
    
 
    
}














