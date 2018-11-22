//
//  MainController.swift
//  BMI Calculator
//
//  Created by Joseph Pereniguez on 22/11/2018.
//  Copyright © 2018 Joseph Pereniguez. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBAction func calculButton(_ sender: Any) {
        
        guard let weightInKG = weightTextField.text else { return }
        guard let heightInCM = heightTextField.text else { return }
        
        let cm = CalculatorBMI(userWeight: weightInKG, userHeight: heightInCM)
        let result = cm.calculBMIAction()
        
        resultLabel.text = "BMI: \(result)"
        
        if (result <= 18.4) {
            stateLabel.text = "Under Weight"
        } else if (result > 18.4 && result <= 25) {
            stateLabel.text = "Normal Weight"
        } else if (result > 25 && result <= 30) {
            stateLabel.text = "Over Weight"
        } else if (result > 30) {
            stateLabel.text = "Obese"
        } else {
            stateLabel.text = ""
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nothing to add for now
    }


}

