//
//  User.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/25/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var name: String = ""
    var email: String = ""
    var language: String = ""
    
    init(name: String, email: String, language: String) {
        self.name = name
        self.email = email
        self.language = language
    }
    
    func updateName(name: String){
            self.name = name
    }
    
    func updateEmail(email: String){
        self.email = email
      }
    
    func updateLanguage(language: String){
          self.language = language
      }
}
