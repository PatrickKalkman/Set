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
        
        for buttonIndex in setCardButtons.indices {
            let button = setCardButtons[buttonIndex]
            button.deselect()
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
            button.layer.cornerRadius = 10
            button.isHidden = true
        }
        
        updateViewFromModel()
    }

    
    @IBAction private func selectCard(_ sender: UIButton) {
        if let cardIndex = setCardButtons.index(of: sender) {
            setGame.select(card: setGame.cardsInGame[cardIndex])
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        var cardButtonIndex = 0
        for card in setGame.cardsInGame {
            let button = setCardButtons[cardButtonIndex]
            ButtonRender.renderCard(cardToRender: card, onButton: button, selectButton: setGame.cardIsSelected(card: card))
            cardButtonIndex += 1
        }
    }
}
