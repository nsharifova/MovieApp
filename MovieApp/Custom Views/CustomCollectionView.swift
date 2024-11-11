import UIKit

class CustomCollectionView: UIView {
    
    var carouselData: [Movies] = []
    var itemSize : CGFloat = 0
    var columnCount : CGFloat = 0

    private lazy var collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           layout.minimumLineSpacing = 16
           let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
           collectionView.dataSource = self
           collectionView.delegate = self
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.showsHorizontalScrollIndicator = false
           collectionView.isPagingEnabled = true
           collectionView.alwaysBounceVertical = false
           collectionView.register(CarouselItemCell.self, forCellWithReuseIdentifier: "CarouselItemCell")
           return collectionView
       }()
       
    private lazy var dataSource: DataSource = {
        let carouselCellRegistration = UICollectionView.CellRegistration<CarouselItemCell, Movies> { cell, indexPath, itemIdentifier in
            cell.configure(text: itemIdentifier.originalTitle,imagePath: itemIdentifier.posterPath ?? "")
        }
        
        return DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: carouselCellRegistration, for: indexPath, item: itemIdentifier)
        }
    }()
    init(frame: CGRect,carouselData : [Movies]) {
        super.init(frame: frame)
        self.carouselData = carouselData
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movies>()
        snapshot.appendSections([.carousel(0)])
        snapshot.appendItems(carouselData)
        dataSource.apply(snapshot)
    }
    override func layoutSubviews() {
           super.layoutSubviews()
           
           guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
           
           let itemWidth = self.bounds.width / columnCount - itemSize
           let itemHeight: CGFloat = 240
           
           layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
           collectionView.collectionViewLayout.invalidateLayout()
       }
}

extension CustomCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselItemCell", for: indexPath) as! CarouselItemCell
        let item = carouselData[indexPath.item]
        cell.configure(text: item.originalTitle, imagePath: item.posterPath ?? "")
        return cell
    }
}
