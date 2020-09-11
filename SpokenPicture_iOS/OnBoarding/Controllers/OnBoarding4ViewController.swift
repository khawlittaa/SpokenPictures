//
//  OnBoarding4ViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/10/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class OnBoarding4ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwipeGesture()
        setButtonAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func addSwipeGesture(){
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                movetoPreviousPage()
            default:
                break
            }
        }
    }
    
    func setButtonAppearance(){
        //        nextButton.backgroundColor = .accentAccent31Main
        nextButton.roundEdges()
    }
    
    func movetoPreviousPage(){
        let page = main.instantiateViewController(withIdentifier: "OnBoarding3ViewController")
        navigationController?.pushViewController(page, animated: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        let welcome = main.instantiateViewController(withIdentifier: "WelcomeViewController")
        navigationController?.pushViewController(welcome, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        movetoPreviousPage()
    }
}
