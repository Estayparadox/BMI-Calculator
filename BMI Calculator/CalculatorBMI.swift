//
//  CalculatorBMI.swift
//  BMI Calculator
//
//  Created by Joseph Pereniguez on 22/11/2018.
//  Copyright © 2018 Joseph Pereniguez. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBMI {
    
    let userWeight: Double
    let userHeight: Double
    
    init(userWeight: String, userHeight: String) {
        self.userWeight = Double(userWeight) ?? 0.0
        self.userHeight = Double(userHeight) ?? 0.0
    }
    
    func calculBMIAction() -> Double {
        return userWeight / ((userHeight / 100) * (userHeight / 100))
    }
}
