//
//  ProfileViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class ProfileViewModel{
    
    let languages = ["Swidish","English","French","Arabic"]
    let disposeBag = DisposeBag()
    var user: User?
    
    // mail and name to biend to VC
    var userName = PublishSubject<String>()
    var emailAddress = PublishSubject<String>()
    var subtitleLanguage = PublishSubject<String>()
    
    func  isValid() -> Observable<Bool> {
        return Observable.combineLatest(self.userName.asObservable().startWith(""), self.emailAddress.asObservable().startWith(""))
            .map{userName, email in
                isValidUserName(userName) && isValidEmail(email)
        }.startWith(false)
    }

}
