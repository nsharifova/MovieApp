//
//  LibraryView.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit

class LibraryView: BaseViewController {
   
    private let searchField : UITextField = {
        let field = UITextField()
        field.placeholder = "Search"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.addPaddingAndIcon(UIImage(named: "SearchIcon")!, padding: 8, isLeftView: false)
        return field
    }()
    override func viewDidLoad() {
        view.addSubview(searchField)
        super.viewDidLoad()
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
      
        
            
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            searchField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
                searchField.heightAnchor.constraint(equalToConstant: 36) ,
            
   
            
            
        ])
    }

 

}
