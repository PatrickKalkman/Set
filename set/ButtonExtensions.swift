//
//  ButtonExtensions.swift
//  set
//
//  Created by Patrick Kalkman on 19/01/2018.
//  Copyright © 2018 SimpleTechture. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func IsSelected() -> Bool {
        return self.layer.borderWidth == 4.0
    }
    
    func select(borderColor: UIColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)) {
        self.layer.borderWidth = 4.0
        self.layer.borderColor = borderColor.cgColor
        self.layer.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    }
    
    func deselect() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        self.layer.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
}
