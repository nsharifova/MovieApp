//
//  CustomLabel.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 09.11.24.
//

import UIKit

class CustomLabel: UILabel {

    init(text: String, font: UIFont) {
           super.init(frame: .zero)
           self.text = text
           self.translatesAutoresizingMaskIntoConstraints = false
           self.font = font
           self.setupLabelStyle()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

       private func setupLabelStyle() {
           self.tintColor = .black
       }
}
