//
//  MainController.swift
//  BMI Calculator
//
//  Created by Joseph Pereniguez on 22/11/2018.
//  Copyright © 2018 Joseph Pereniguez. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var calculButtonOutlet: UIButton!
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculButtonOutlet.layer.cornerRadius = 5
        cancelButtonOutlet.layer.cornerRadius = 5
    }
    
    // MARK: Actions
    
    @IBAction func calculButton(_ sender: UIButton) {
        
        guard let weightInKG = weightTextField.text else { return }
        guard let heightInCM = heightTextField.text else { return }
        
        let cm = CalculatorBMI(userWeight: weightInKG, userHeight: heightInCM)
        let result = cm.calculBMIAction()
        
        
        // g kodé com 1 sal :)
        if (result <= 18.4) {
            resultLabel.text = "BMI: \(result)"
            stateLabel.text = "Under Weight"
        } else if (result > 18.4 && result <= 25) {
            resultLabel.text = "BMI: \(result)"
            stateLabel.text = "Normal Weight"
        } else if (result > 25 && result <= 30) {
            resultLabel.text = "BMI: \(result)"
            stateLabel.text = "Over Weight"
        } else if (result > 30) {
            resultLabel.text = "BMI: \(result)"
            stateLabel.text = "Obese"
        } else {
            resultLabel.text = "You must fill the fields correctly."
            stateLabel.text = "Example: weight: 68 height: 178"
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
        dismiss(animated: true)
        
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        
        cancelButtonOutlet.isHidden = true
        
    }
    
    // MARK: Functions
    
    // Deprecated
    func checker(textField: UITextField) -> Bool {
        guard (!textField.text!.isEmpty) else {
            return false
        }
        return true
    }

}

extension MainController: UITextFieldDelegate {
    
    // MARK: Extensions
    
    @IBAction func weightDidChange(_ sender: UITextField) {
        if cancelButtonOutlet.isHidden {
            cancelButtonOutlet.isHidden = false
        }
    }
    
    @IBAction func heightDidChange(_ sender: UITextField) {
        
        if cancelButtonOutlet.isHidden {
            cancelButtonOutlet.isHidden = false
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
}

