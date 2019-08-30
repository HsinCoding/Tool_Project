//
//  VerifierTookl.swift
//  Test_Project
//
//  Created by ＵＳＥＲ on 2019/8/30.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

class VerifierTookl: NSObject {

    // Identification verifier
    func validatedIdentityCard(identityCardStr:String) -> Bool {
        
        let identityCard = identityCardStr.trimmingCharacters(in: CharacterSet.whitespaces)
        let regex =  "[A-Z][0-9]{9}"
        let predicate = NSPredicate(format:"SELF MATCHES %@",regex)
        let result = predicate.evaluate(with: identityCard)
        return result
    }
    
    // Phone verifier
    func validatedPhoneNumber(phoneNumber:String) -> Bool {
        
        if phoneNumber.count == 0 {
            return false
        }
        let mobile = "[09]{2}[0-9]{8}"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: phoneNumber) == true {
            return true
        } else {
            return false
        }
    }
    
    // Email verifier
    func validatedEmail(email:String) -> Bool {
        
        if email.count == 0 {
            return false
        }
        
        let emailRegex = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    // Password verifier (6-8 password including alphabet and number)
    func validatedPassword(password:String) -> Bool {
        
        let passwordRule = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,8}$"
        let regexPassword = NSPredicate(format: "SELF MATCHES %@",passwordRule)
        if regexPassword.evaluate(with: password) == true {
            return true
        } else {
            return false
        }
    }
    
    
    
}
