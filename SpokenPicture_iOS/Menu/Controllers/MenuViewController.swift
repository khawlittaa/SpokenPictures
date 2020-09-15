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
    let menu = UIStoryboard(name: "Menu", bundle: nil)
        
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
        
        if (indexPath.row == 1){
            selectMenuItem(itemTitle: "MenuProfileViewController")
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
