//
//  MenuViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/15/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    let menuViewModel = MenuviewModel()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        self.setBackgrouudImage(imageName: "background_menu")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpTableView(){
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.registerCell(nib: "MenuTableViewCell", cellreuseIdentifier: "MenuTableViewCell")
    }
    
    func selectMenuItem(itemTitle: String){
        let menuItem = menu.instantiateViewController(withIdentifier: itemTitle)
        self.navigationController?.pushViewController(menuItem, animated: true)
    }
    
    @IBAction func menuButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension MenuViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            let cartVC = payment.instantiateViewController(withIdentifier: "MenuCartViewController")
            self.navigationController?.pushViewController(cartVC, animated: true)
            
        }else{
        if (indexPath.row == 1){
            let userVC = menu.instantiateViewController(withIdentifier: "MenuProfileViewController") as! MenuProfileViewController
            userVC.profileVM.user = user
            self.navigationController?.pushViewController(userVC, animated: true)
        }else{
            if indexPath.row == 2{
                let orderVC = menu.instantiateViewController(withIdentifier: "MenuOrderViewController")
                self.navigationController?.pushViewController(orderVC, animated: true)
            }
            else{
                if indexPath.row == 3{
                    let notificationVC = menu.instantiateViewController(withIdentifier: "MenuNotificationViewController")
                    self.navigationController?.pushViewController(notificationVC, animated: true)
                    
                }else{
                    if indexPath.row == 4{
                        
                    }
                }
            }
        }
           }
    }
}
    extension MenuViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuViewModel.menuTitles.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
            cell.setUpUI(image: menuViewModel.menuImages[indexPath.row], title: menuViewModel.menuTitles[indexPath.row])
            return cell
        }
        
        
        
}
