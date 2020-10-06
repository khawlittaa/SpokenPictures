//
//  PostcardDropMenuViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 10/2/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class PostcardDropMenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var menuBackView: UIView!
    
    var items: [MenuItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        showAnimate()
        addNavigationBarItemsWithMenu(iscomplete: false)
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate()
       {
           UIView.animate(withDuration: 0.25, animations: {
               self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
               self.view.alpha = 0.0
           }, completion: {(finished : Bool) in
               if(finished)
               {
                   self.willMove(toParent: nil)
                   self.view.removeFromSuperview()
                   self.removeFromParent()
               }
           })
       }
    
    func setUpTableView(){
        menuTableView.dataSource = self
        menuTableView.registerCell(nib: "DropMenuCell", cellreuseIdentifier: "DropMenuCell")
        menuBackView.addViewShadow()
        
    }
}


extension PostcardDropMenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropMenuCell") as! DropMenuCell
        cell.setCellDate(menuItem: items![indexPath.row])
        return cell
    }
}
