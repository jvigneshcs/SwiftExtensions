//
//  UIViewController.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String?, message: String?, preferredStyle style: UIAlertController.Style = .alert, actions: [UIAlertAction], animated: Bool = true, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alertController.addAction(action)
        }
        present(alertController, animated: animated, completion: completion)
    }
}
