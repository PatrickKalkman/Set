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
            button.isHidden = true
        }
        
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        var cardButtonIndex = 0
        for card in setGame.cardsInGame {
            let button = setCardButtons[cardButtonIndex]
            renderCard(cardToRender: card, onButton: button)
            cardButtonIndex += 1
        }
    }
    
    private func renderCard(cardToRender card: Card, onButton: UIButton) {
        let cardColor: UIColor
        
        onButton.isHidden = false
        
        let cardSymbol: String
        switch card.cardSymbol {
        case .diamond:
            cardSymbol = "♦︎"
        case .oval:
            cardSymbol = "●"
        case .squiggle:
            cardSymbol = "■"
        }
        
        switch card.cardColor {
        case .green:
            cardColor = UIColor.green
        case .red:
            cardColor = UIColor.red
        case .purple:
            cardColor = UIColor.purple
        }
        onButton.setTitleColor(cardColor, for: UIControlState.normal)
    
        let buttonTitle: String
        switch card.cardNumber {
        case .one:
            buttonTitle = cardSymbol
        case .two:
            buttonTitle = "\(cardSymbol) \(cardSymbol)"
        case .three:
            buttonTitle = "\(cardSymbol) \(cardSymbol) \(cardSymbol)"
        }
        onButton.setTitle(buttonTitle, for: UIControlState.normal)
        onButton.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        
        var attributes: [NSAttributedStringKey: Any] = [:]
        
        switch card.cardShading {
        case .open:
            attributes[.strokeWidth] = 4
        case .solid:
            attributes[.strokeWidth] = -1
        case .striped:
           attributes[.strokeWidth] = -1
           attributes[.foregroundColor] = cardColor.withAlphaComponent(0.15)
        }
        
        let attributedString = NSAttributedString(string: buttonTitle, attributes: attributes)
        onButton.setAttributedTitle(attributedString, for: UIControlState.normal)
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

