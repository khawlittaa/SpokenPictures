//
//  WelcomeViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class WelcomeViewModel {
    
    let languages = ["English", "Arabic", "French"]
    
    // mail and name to biend to VC 
    var nameText: String = "test"
    var emailText: String = "mail@test.com"
    
    func ValidateCredentials() -> Bool{
        return isValidEmail(emailText) && isValidUserName(nameText)
    }
}
