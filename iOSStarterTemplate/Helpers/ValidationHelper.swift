//
//  ValidationHelper.swift
//  iOSStarterTemplate
//
//  Created by diayan siat on 27/11/2023.
//

import Foundation

enum ValidationHelper {
    /// Source: https://stackoverflow.com/questions/27998409/email-phone-validation-in-swift
    static func validateEmail(_ emailText: String) -> Bool {
        let emailText = emailText.trimmingCharacters(in: .whitespaces)

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    
        return emailTest.evaluate(with: emailText)
    }
}

