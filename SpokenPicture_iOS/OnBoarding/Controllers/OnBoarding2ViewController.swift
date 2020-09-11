//
//  OnBoarding2ViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/10/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class OnBoarding2ViewController: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwipeGesture()
        skipButton.setSkipButtonAppearance()
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
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func movetoNextPage(){
        
        let page = main.instantiateViewController(withIdentifier: "OnBoarding3ViewController")
        navigationController?.pushViewController(page, animated: true)
    }
    
    func movetoPreviousPage(){
        
        let page = main.instantiateViewController(withIdentifier: "OnBoarding1ViewController")
        navigationController?.pushViewController(page, animated: true)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                movetoPreviousPage()
            case .left:
                print("Swiped left")
                movetoNextPage()
            default:
                break
            }
        }
    }
    
    @IBAction func skipButtonClicked(_ sender: Any) {
        
        let welcome = main.instantiateViewController(withIdentifier: "WelcomeViewController")
        navigationController?.pushViewController(welcome, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        movetoPreviousPage()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        movetoNextPage()
    }
}
