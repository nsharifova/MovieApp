////
////  HomeView.swift
////  MovieApp
////
////  Created by Nurluay Sharifova on 08.11.24.
////
//
//import UIKit
//
//class OtherView: UIViewController {
//    var collectionView : UICollectionView!
//    
//    var centerCell: CustomImageCollectionViewCell?
//    let carouselItems = [("1", UIColor(red: 1, green: 0, blue: 0, alpha: 1)),("2", UIColor(red: 0, green: 1, blue: 0, alpha: 1)), ("3", UIColor(red: 0, green: 0, blue: 1, alpha: 1))]
//    let cellScale: CGFloat = 0.6
//    let numberOfItems = 100
//    var bannerIndicatorIndex = 1
//    
//    
//    let menuIcon : UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "MenuIcon"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    let searchIcon : UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "SearchIcon"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    let titleLabel : UILabel = {
//        let label = UILabel()
//        label.text = "Movies"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.boldSystemFont(ofSize: 24);
//        return label
//    }()
//    let titleSecondLabel : UILabel = {
//        let label = UILabel()
//        label.text = "Popular"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 20)
//        return label
//    }()
//    
//    let seeAllButton : UIButton = {
//        let button = UIButton()
//        button.setTitle("See all", for: .normal)
//        button.setImage(UIImage(named: "RightIcon"), for: .normal)
//        button.imageView?.contentMode = .scaleAspectFit
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.semanticContentAttribute = .forceRightToLeft
//        button.setTitleColor(UIColor(named: "MainBlue"), for: .normal)
//        return button
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUpCollectionView()
//
//        view.addSubview(menuIcon)
//        view.addSubview(searchIcon)
//        view.addSubview(titleLabel)
//        view.addSubview(titleSecondLabel)
//        view.addSubview(seeAllButton)
//        view.addSubview(collectionView)
//
//     setUpConstraint()
//        
//    }
//
//    func setUpCollectionView() {
//            let screenSize = UIScreen.main.bounds.size
//            let cellWidth = floor(screenSize.width * cellScale)
//            let cellHeight = floor(screenSize.height * cellScale)
//            let insetX = (view.bounds.width - cellWidth) / 2.0
//            let insetY = (view.bounds.height - cellHeight) / 2.0
//
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
//            layout.minimumLineSpacing = 0
//
//            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//            collectionView.delegate = self
//            collectionView.dataSource = self
//            collectionView.isPagingEnabled = true
//        collectionView.register(CustomImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//            collectionView.translatesAutoresizingMaskIntoConstraints = false
//            collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
//            
//            let indicatorLayout = UICollectionViewFlowLayout()
//            indicatorLayout.scrollDirection = .horizontal
//            indicatorLayout.itemSize = CGSize(width: 10, height: 10)
//        
//         
//
//        }
//            override func viewDidAppear(_ animated: Bool) {
//      collectionView.scrollToItem(at: IndexPath(item: self.numberOfItems/2, section: 0), at: .centeredHorizontally, animated: true)
//    }
//    func setUpConstraint() {
//        NSLayoutConstraint.activate([
//            menuIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            menuIcon.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 24),
//            menuIcon.widthAnchor.constraint(equalToConstant: 24),
//            menuIcon.heightAnchor.constraint(equalToConstant: 24),
//            
//            searchIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            searchIcon.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -24),
//            searchIcon.widthAnchor.constraint(equalToConstant: 24),
//            searchIcon.heightAnchor.constraint(equalToConstant: 24),
//            
//            titleLabel.topAnchor.constraint(equalTo: menuIcon.bottomAnchor,constant: 24),
//            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 24),
//            
//            titleSecondLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 24),
//            titleSecondLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 24),
//            
//            seeAllButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 24),
//            seeAllButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -24),
//            
//            collectionView.topAnchor.constraint(equalTo: titleSecondLabel.bottomAnchor, constant: 24),
//            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
//            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            collectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,constant: -200),
//            
//       
//            
//        ])
//    }
//    
//    
//    
//}
//
//
////extension OtherView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
////  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////    
////      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomImageCollectionViewCell
////
////      return cell
////    
////  }
////  
////  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////    if collectionView == self.collectionView {
////      return numberOfItems
////    } else {
////      return carouselItems.count
////    }
////  }
////  
////  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
////    let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
////    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
////    var offset = targetContentOffset.pointee
////    let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
////    let roundedIndex = round(index)
////    offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
////    
////    targetContentOffset.pointee = offset
////  }
////  
////  func scrollViewDidScroll(_ scrollView: UIScrollView) {
////    guard scrollView is UICollectionView else {return}
////
////    let centerPoint = CGPoint(x: self.collectionView.frame.size.width / 2 + scrollView.contentOffset.x,
////                              y: self.collectionView.frame.size.height / 2 + scrollView.contentOffset.y)
////    if let indexPath = self.collectionView.indexPathForItem(at: centerPoint) {
////      self.bannerIndicatorIndex = indexPath.row % carouselItems.count
////      self.centerCell = (self.collectionView.cellForItem(at: indexPath) as? CustomImageCollectionViewCell)
//////        self.centerCell?.transformToLarge()
//////        self.carouselIndicator.reloadData()
////        
////    }
////
////    if let cell = self.centerCell {
////      let offsetX = centerPoint.x - cell.center.x
////      if offsetX < -40 || offsetX > 40 {
////        cell.transformToStandard()
////        self.centerCell = nil
////      }
////    }
////  }
////}
