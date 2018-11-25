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
        
        // Check if the textfields are empty or not
        guard let checker1 = weightTextField.text, !checker1.isEmpty else {
            showAlert()
            return
        }
        
        guard let checker2 = heightTextField.text, !checker2.isEmpty else {
            showAlert()
            return
        }
        
        // Check if the textfields contain only numbers or not
        let characterset = CharacterSet(charactersIn: ".0123456789")
        if heightTextField.text!.rangeOfCharacter(from: characterset.inverted) != nil {
            showAlert()
            return
        }
        
        if weightTextField.text!.rangeOfCharacter(from: characterset.inverted) != nil {
            showAlert()
            return
        }
        
        // Check if the weight or the height are equal to nil or 0
        if let n = NumberFormatter().number(from: weightTextField.text!) {
            let f = CGFloat(truncating: n)
            if f == 0 {
                showAlertInput()
                return
            }
        }
        
        if let n = NumberFormatter().number(from: heightTextField.text!) {
            let f = CGFloat(truncating: n)
            if f == 0 {
                showAlertInput()
                return
            }
        }
        
        // Call the CalculatorBMI Struct
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
            resultLabel.text = "Fill the fields to know your BMI."
            stateLabel.text = "Example: weight: 68.4 height: 178.2"
        }
    }
    
    // MARK: Actions
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
        dismiss(animated: true)
        
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        
        cancelButtonOutlet.isHidden = true
        
    }
    
    // MARK: Functions
    
    func showAlert() {
        resultLabel.text = "Fill the fields to know your BMI."
        stateLabel.text = "Example: weight: 68.4 height: 178.2"
        let alertController = UIAlertController(title: "Wrong values", message: "You must fill the fields with numeric values.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showAlertInput() {
        resultLabel.text = "Fill the fields to know your BMI."
        stateLabel.text = "Example: weight: 68.4 height: 178.2"
        let alertController = UIAlertController(title: "Wrong values", message: "Your weight or your height can not be equal to 0.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }

}

// MARK: Extensions

extension MainController: UITextFieldDelegate {
    
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

// not used
extension UITextField {
    var floatValue : Float {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let nsNumber = numberFormatter.number(from: text!)
        return nsNumber == nil ? 0.0 : nsNumber!.floatValue
    }
}
