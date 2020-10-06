//
//  NotificationsViewModel.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import Foundation

class NotificationsViewModel {
    
    var notifications: [Notification] = [Notification]()
    
    init() {
        let notif = Notification(isNew: true, type: .sync)
        notifications.append(notif)
        let notif1 = Notification(isNew: false, type: .collab)
        notifications.append(notif1)
    }
}
