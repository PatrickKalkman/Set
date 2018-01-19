//
//  ViewController.swift
//  set
//
//  Created by Patrick Kalkman on 18/01/2018.
//  Copyright © 2018 SimpleTechture. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var setCardButtons: [UIButton]!
    
    let setGame = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for buttonIndex in setCardButtons.indices {
            let button = setCardButtons[buttonIndex]
            deselectButton(buttonToDeselect: button)
            button.layer.cornerRadius = 10
        }
    }

    @IBAction private func selectCard(_ sender: UIButton) {
        if (!buttonIsSelected(button: sender)) {
            selectButton(buttonToSelect: sender)
        } else {
            deselectButton(buttonToDeselect: sender)
        }
    }
    
    private func buttonIsSelected(button: UIButton) -> Bool {
        return button.layer.borderWidth == 4.0
    }
    
    private func selectButton(buttonToSelect button: UIButton) {
        button.layer.borderWidth = 4.0
        button.layer.borderColor = #colorLiteral(red: 0.5704585314, green: 0.5704723597, blue: 0.5704649091, alpha: 1)
        button.layer.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    }
    
    private func deselectButton(buttonToDeselect button: UIButton) {
        button.layer.borderWidth = 2.0
        button.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        button.layer.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
}

