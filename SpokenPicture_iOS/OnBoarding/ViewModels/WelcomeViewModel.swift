//
//  WelcomeViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/11/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class WelcomeViewModel {
    
    let languages = ["English", "Arabic", "French"]
    let disposeBag = DisposeBag()
    
    // mail and name to biend to VC
    var userName = PublishSubject<String>()
    var emailAddress = PublishSubject<String>()
    
    func  isValid() -> Observable<Bool> {
        return Observable.combineLatest(self.userName.asObservable().startWith(""), self.emailAddress.asObservable().startWith(""))
            .map{userName, email in
                isValidUserName(userName) && isValidEmail(email)
        }.startWith(false)
    }
    
}
