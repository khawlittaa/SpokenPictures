//
//  MenuNotificationViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class MenuNotificationViewController: UIViewController {
    @IBOutlet weak var notificationsTableView: UITableView!
    
    var notificationsVM = NotificationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }

    func setTableView(){
        notificationsTableView.dataSource = self
        notificationsTableView.registerCell(nib: "MenuNotificationCell", cellreuseIdentifier: "MenuNotificationCell")
      }
    

}

extension MenuNotificationViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsVM.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuNotificationCell")as! MenuNotificationCell
        cell.notification = notificationsVM.notifications[indexPath.row]
        cell.setUpUI()
        return cell
    }
    
    
}
