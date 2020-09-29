//
//  MenuNotificationCell.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/29/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class MenuNotificationCell: UITableViewCell {
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var syncButton: UIButton!
    
    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationBodyLabel: UILabel!
    @IBOutlet weak var notificatiobDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundEdges()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func roundEdges(){
          syncButton.layer.cornerRadius = 10
          syncButton.clipsToBounds = true
      }
    
    @IBAction func syncButtonTapped(_ sender: Any) {
    }
    
    @IBOutlet weak var cancelButtonTapped: NSLayoutConstraint!
    
}
