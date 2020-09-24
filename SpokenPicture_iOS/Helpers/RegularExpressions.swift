//
//  RegularExpressions.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

let userNameRegEx = "[a-zA-Z][a-zA-Z0-9-_.]{3,50}"
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,60}"
let postCardTextRegEx = "[a-zA-Z][a-zA-Z-_.]{3,500}"

func isValidEmail(_ email: String) -> Bool {
    
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

func isValidUserName(_ userName:String) -> Bool {
    
    let userNamePred = NSPredicate(format:"SELF MATCHES %@", userNameRegEx )
    return userNamePred.evaluate(with: userName)
}

