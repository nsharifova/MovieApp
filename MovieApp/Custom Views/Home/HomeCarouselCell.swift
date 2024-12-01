

import UIKit

class HomeCarouselCell: UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    var movieData : [Movies]?
    var movieViewModel = MovieViewModel()
    weak var viewController: UIViewController?
    weak var movieCollection: MovieCollectionView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(label)
        contentView.addSubview(collectionView)
        contentView.addSubview(seeAllButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.textAlignment = .left
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
        button.addTarget(self, action: #selector(seeAllAction), for: .touchUpInside)
        return button
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CarouselItemCell.self, forCellWithReuseIdentifier: "CarouselItemCell")
        return collectionView
    }()
    @objc func seeAllAction(){
        movieCollection?.movieData = movieData
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            seeAllButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            
        ])
    }
    
    func configure(data:CategoryMovie) {
        label.text = data.title
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselItemCell", for: indexPath) as! CarouselItemCell
        guard let movies = movieData else {
            return cell
        }
        let item = movies[indexPath.row]
        cell.configure(data: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = MovieDetailsView()
        guard let movies = movieData else { return }
        
        let item = movies[indexPath.row]
        controller.id = item.id
        if let navigationController = viewController?.navigationController {
            movieViewModel.getMovieDetailInfo(id: item.id){ result in
                DispatchQueue.main.async {
                    switch result {
                    case .success:
                        controller.movieDetail = self.movieViewModel.detailInfo
                        navigationController.pushViewController(controller, animated: true)
                        
                    case .failure(let error):
                        print(error)
                    }
                }
                
            }
        }
        
        
        
        
        
    }
    
}
extension HomeCarouselCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 48) / 2
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
