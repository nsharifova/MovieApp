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
    private let searchField : UITextField = {
        let field = UITextField()
        field.placeholder = "Search"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.addPaddingAndIcon(UIImage(named: "SearchIcon")!, padding: 8, isLeftView: false)
        return field
    }()

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
     
        view.addSubview(menuIcon)
        view.addSubview(searchField)
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
            menuIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            menuIcon.widthAnchor.constraint(equalToConstant: 24),
            menuIcon.heightAnchor.constraint(equalToConstant: 24),
            
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
                searchField.leadingAnchor.constraint(equalTo: menuIcon.trailingAnchor, constant: 16),
                searchField.heightAnchor.constraint(equalToConstant: 36) ,
            
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
        cell.viewController = self
        cell.movieData = item.movies
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200)
    }
    
 
    
}














