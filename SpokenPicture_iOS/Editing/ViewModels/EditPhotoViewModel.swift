//
//  EditPhotoViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/18/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation
import RxSwift

class EditPhotoViewModel {
    var hasAudio = BehaviorSubject<Bool>(value: false)
    var audiolength: Int = 0
}
