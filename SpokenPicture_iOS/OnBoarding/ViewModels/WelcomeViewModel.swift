//
//  WelcomeViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class WelcomeViewModel {
    
    let languages = ["", "English", "Arabic", "French"]
    
    func ValidateCredentials(email: String, name: String) -> Bool{
        
        return isValidEmail(email) && isValidUserName(name)
        
    }
}
