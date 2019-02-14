//
//  UITextField.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright (c) 2019 VigneshJeyaraj. All rights reserved.
//

import UIKit

extension UITextField {
    
    func siblingTextFieldWithTag(_ tag: Int) -> UITextField? {
        return self.superview?.viewWithTag(tag) as? UITextField
    }
    
    func hasSiblingTextFieldWithTag(_ tag: Int) -> Bool {
        let siblingTextField: UITextField? = siblingTextFieldWithTag(tag)
        return siblingTextField != nil
    }
    
    func nextActiveSiblingTextField() -> UITextField? {
        let siblingTextField: UITextField? = siblingTextFieldWithTag(self.tag + 1)
        if let textField: UITextField = siblingTextField {
            if !textField.isEnabled {
                return textField.nextActiveSiblingTextField()
            }
        }
        return siblingTextField
    }
    
    func previousActiveSiblingTextField() -> UITextField? {
        let siblingTextField: UITextField? = siblingTextFieldWithTag(self.tag - 1)
        if let textField: UITextField = siblingTextField {
            if !textField.isEnabled {
                return textField.previousActiveSiblingTextField()
            }
        }
        return siblingTextField
    }
    
    func makeNextFieldResonderOrResign() {
        makeFirstResponderOrResign(for: nextActiveSiblingTextField())
    }
    
    func makePreviousFieldResponderOrResign() {
        makeFirstResponderOrResign(for: previousActiveSiblingTextField())
    }
    
    private func makeFirstResponderOrResign(for textField: UITextField?) {
        if let nextTextField = textField {
            nextTextField.becomeFirstResponder()
        } else {
            self.resignFirstResponder()
        }
    }
}
