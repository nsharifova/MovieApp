//
//  UITextFieldExtension.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 13.11.24.
//

import Foundation
import UIKit

extension UITextField {
  func addPaddingAndIcon(_ image: UIImage, padding: CGFloat,isLeftView: Bool) {
    let frame = CGRect(x: 0, y: 0, width: image.size.width + padding, height: image.size.height)
    
    let outerView = UIView(frame: frame)
    let iconView  = UIImageView(frame: frame)
    iconView.image = image
    iconView.contentMode = .center
      outerView.addSubview(iconView)
    
    if isLeftView {
      leftViewMode = .always
      leftView = outerView
    } else {
      rightViewMode = .always
      rightView = outerView
    }
    
  }
}
