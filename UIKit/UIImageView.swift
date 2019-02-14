//
//  UIImageView.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func displayedImageBounds() -> CGRect? {
        
        if let imageSize = image?.size {
            let boundsWidth = bounds.size.width
            let boundsHeight = bounds.size.height
            let imageRatio = imageSize.width / imageSize.height
            let viewRatio = boundsWidth / boundsHeight
            if viewRatio > imageRatio {
                let scale = boundsHeight / imageSize.height
                let width = scale * imageSize.width
                let topLeftX = (boundsWidth - width) * 0.5
                return CGRect(x: topLeftX, y: 0, width: width, height: boundsHeight)
            }
            let scale = boundsWidth / imageSize.width
            let height = scale * imageSize.height
            let topLeftY = (boundsHeight - height) * 0.5
            return CGRect(x: 0, y: topLeftY, width: boundsWidth, height: height)
        }
        return nil
    }
}
