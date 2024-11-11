

import UIKit

class CarouselItemCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(label)
        contentView.addSubview(image)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .headline)
        view.textAlignment = .left
        return view
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -4),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    func configure(text: String,imagePath:String) {
        label.text = text
        if let url = URL(string: "https://image.tmdb.org/t/p/original/\(imagePath)") {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.image.image = UIImage(data: data)
                        }
                    }
                }
            }
       
    }
}
