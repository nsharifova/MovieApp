//
//  Helper.swift
//  MovieApp
//
//  Created by Nurluay Sharifova on 15.11.24.
//

import Foundation
import UIKit

func showAlert(on viewController: UIViewController, title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(okAction)
    viewController.present(alertController, animated: true, completion: nil)
}

