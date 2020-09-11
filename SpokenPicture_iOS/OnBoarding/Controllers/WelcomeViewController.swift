//
//  WelcomeViewController.swift
//  SpokenPicture_iOS
//
//  Created by khaoula hafsia on 9/10/20.
//  Copyright © 2020 BothofUS. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    
    let welcomeVM = WelcomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLanguagePicker()
        setButtonAppearance()
    }
    
    func setButtonAppearance(){
        getStartedButton.isValid = false
        getStartedButton.roundEdges()
    }
    
    func setLanguagePicker(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        languageTextField.inputView = pickerView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension WelcomeViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    // Sets number of columns in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return welcomeVM.languages.count
    }
    
    // This function sets the text of the picker view to the content of the "languages" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return welcomeVM.languages[row]
    }
    // When user selects an option, this function will set the text of the text field to reflect the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row != 0 && welcomeVM.ValidateCredentials(email: emailTextField.text ?? "", name: nameTextField.text ?? ""){
            languageTextField.text = welcomeVM.languages[row]
            getStartedButton.isValid = true
        }
    }
    
}
