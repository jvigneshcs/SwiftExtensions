//
//  UIView.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadFromNib(withName name: String, forClass type: AnyClass) {
        loadFromNib(withName: name, forClass: type, atIndex: 0)
    }
    
    func loadFromNib(withName name: String, forClass type: AnyClass, atIndex index: UInt) {
        let bundle = Bundle(for: type)
        let nib = UINib(nibName: name, bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let objects = nib.instantiate(withOwner: self, options: nil)
        let nibView: UIView?
        if Int(index) < objects.count {
            nibView = objects[Int(index)] as? UIView
        } else {
            nibView = objects.first as? UIView
        }
        if let view = nibView {
            // use bounds not frame or it'll be offset
            view.frame = bounds
            
            // Make the view stretch with containing view
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            // Adding custom subview on top of our view (over any custom drawing > see note below)
            addSubview(view)
        }
    }
    
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /// Adds constraints to this `UIView` instances `superview` object to make sure this always has the same size as the superview.
    /// Please note that this has no effect if its `superview` is `nil` – add this `UIView` instance as a subview before calling this.
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            print("Error! `superview` was nil – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.")
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
}
