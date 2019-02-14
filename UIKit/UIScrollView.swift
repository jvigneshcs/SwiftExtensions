//
//  UIScrollView.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    func scroll(forView view: UIView, contentFrame: CGRect, targetHeight: CGFloat, bottomPadding: CGFloat) {
        var aRect = contentFrame
        aRect.size.height = targetHeight
        self.contentSize = aRect.size
        
        aRect = contentFrame
        if contentFrame.height > self.frame.height {
            aRect.origin.y = self.contentOffset.y
            aRect.size.height = self.frame.height
        }
        aRect.size.height -= bottomPadding
        let textFieldEndPoint = CGPoint(x: view.frame.origin.x, y: view.frame.origin.y + view.frame.height)
        if (!aRect.contains(textFieldEndPoint)) {
            var activeFieldFrame = view.frame
            activeFieldFrame.origin.y += bottomPadding
            self.scrollRectToVisible(activeFieldFrame, animated: true)
        }
    }
}
