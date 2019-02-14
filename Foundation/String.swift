//
//  String.swift
//  Extensions
//
//  Created by Vignesh J on 2/14/19.
//  Copyright © 2019 VigneshJeyaraj. All rights reserved.
//

import Foundation

extension String {
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    var trimmingSpaces: String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    var trimmingSpacesAndWhiteLines: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return isConfirms(toRegEx: emailRegEx)
    }
    
    var isBlank: Bool {
        let trimmed = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
    func isConfirms(toRegEx regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: self)
    }
}
