//
//  Notification.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

enum NotificationType{
    case sync
    case collab
    case shiped
    case view
}
class Notification{
    var title: String = ""
    var body: String = ""
    var date: String = ""
    var isNew: Bool = true
    var type: NotificationType = .sync
    
    init(isNew: Bool, type: NotificationType) {
        self.isNew = isNew
        self.type = type
    }
}
