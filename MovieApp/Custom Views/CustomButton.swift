//
//  CustomButton.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 08.11.24.
//

import UIKit

class CustomButton: UIButton {

    init(imageName: String, target: Any?, action: Selector? = nil) {
           super.init(frame: .zero)
           self.setImage(UIImage(named: imageName), for: .normal)
           if let action = action {
            self.addTarget(target, action: action, for: .touchUpInside)

           }
           self.translatesAutoresizingMaskIntoConstraints = false
           self.setupButtonStyle()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

       private func setupButtonStyle() {
           self.tintColor = .black
       }
    

    

}
