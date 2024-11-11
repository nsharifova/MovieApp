//
//  HomeView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//
import UIKit

class HomeView: UIViewController {
    var movieViewModel = MovieViewModel()
    private let menuIcon = CustomButton(imageName: "MenuIcon", target: HomeView.self)
    private let searchIcon = CustomButton(imageName: "SearchIcon", target: HomeView.self)
    private let mainTitle = CustomLabel(text: "Movies", font: UIFont.boldSystemFont(ofSize: 24))
    private let titleSecondLabel = CustomLabel(text: "Popular", font: UIFont.systemFont(ofSize: 20))
    private let bottomSectionTitle = CustomLabel(text: "Top Rated", font: UIFont.systemFont(ofSize: 20))
    private let bottomSectionTitle2 = CustomLabel(text: "Now Playing", font: UIFont.systemFont(ofSize: 20))
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
      }()
    private lazy var contentView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
 
      
    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setImage(UIImage(named: "RightIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(UIColor(named: "MainBlue"), for: .normal)
        return button
    }()
    private let bottomSeeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setImage(UIImage(named: "RightIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(UIColor(named: "MainBlue"), for: .normal)
        return button
    }()
    private let bottomSeeAllButton2: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setImage(UIImage(named: "RightIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.semanticContentAttribute = .forceRightToLeft
        button.setTitleColor(UIColor(named: "MainBlue"), for: .normal)
        return button
    }()
    
    
    private lazy var collectionView: CustomCollectionView = {
        let customView = CustomCollectionView(frame: .zero, carouselData: movieViewModel.movie)
        customView.itemSize = 40
        customView.columnCount = 2
        return customView
    }()

    private lazy var collectionView2: CustomCollectionView = {
        let customView = CustomCollectionView(frame: .zero, carouselData: movieViewModel.topRatedMovies)
        customView.itemSize = 0
        customView.columnCount = 2
        return customView
    }()
    private lazy var collectionView3: CustomCollectionView = {
        let customView = CustomCollectionView(frame: .zero, carouselData: movieViewModel.nowPlayingMovies)
        return customView
    }()
    override func viewDidAppear(_ animated: Bool) {
       scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+300)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(collectionView)
        contentView.addSubview(collectionView2)
        contentView.addSubview(collectionView3)
        contentView.addSubview(menuIcon)
        contentView.addSubview(searchIcon)
        contentView.addSubview(mainTitle)
        contentView.addSubview(titleSecondLabel)
        contentView.addSubview(seeAllButton)
        contentView.addSubview(bottomSeeAllButton)
        contentView.addSubview(bottomSectionTitle)
        contentView.addSubview(bottomSectionTitle2)
        contentView.addSubview(bottomSeeAllButton2)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.reloadData()
        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        collectionView2.reloadData()
        setUpConstraints()
   
        movieViewModel.getPopularMovies { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.collectionView.carouselData = self.movieViewModel.movie
                    self.collectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
        movieViewModel.getTopRatedMovies { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.collectionView2.carouselData = self.movieViewModel.topRatedMovies
                    self.collectionView2.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
        movieViewModel.getNowPlayingMovies { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.collectionView3.carouselData = self.movieViewModel.nowPlayingMovies
                    self.collectionView3.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
 
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: collectionView3.bottomAnchor, constant: 16),
            
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
            
            titleSecondLabel.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 24),
            titleSecondLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            seeAllButton.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 24),
            seeAllButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            collectionView.topAnchor.constraint(equalTo: titleSecondLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: 0.25),

            
            bottomSectionTitle.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
            bottomSectionTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            bottomSeeAllButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
            bottomSeeAllButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            collectionView2.topAnchor.constraint(equalTo: bottomSectionTitle.bottomAnchor, constant: 16),
             collectionView2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             collectionView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             collectionView2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            bottomSectionTitle2.topAnchor.constraint(equalTo: collectionView2.bottomAnchor, constant: 24),
            bottomSectionTitle2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            
            bottomSeeAllButton2.topAnchor.constraint(equalTo: collectionView2.bottomAnchor, constant: 24),
            bottomSeeAllButton2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            collectionView3.topAnchor.constraint(equalTo: bottomSectionTitle2.bottomAnchor, constant: 16),
             collectionView3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             collectionView3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             collectionView3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
   
    
    
}




