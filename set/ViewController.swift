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
    @IBOutlet weak var dealThreeMoreCardsButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let setGame = SetGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButtons()
        updateViewFromModel()
    }
    
    func resetButtons() {
        for buttonIndex in setCardButtons.indices {
            let button = setCardButtons[buttonIndex]
            button.deselect()
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
            button.layer.cornerRadius = 10
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
            button.layer.borderColor =  #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
            button.setAttributedTitle(nil, for: UIControlState.normal)
        }
    }

    @IBAction private func selectCard(_ sender: UIButton) {
        if let cardIndex = setCardButtons.index(of: sender) {
            if cardIndex < setGame.cardsInGame.count {
                setGame.select(card: setGame.cardsInGame[cardIndex])
            }
            updateViewFromModel()
        }
    }
    
    @IBAction func newGame() {
        dealThreeMoreCardsButton.isEnabled = true
        setGame.newGame()
        resetButtons()
        updateViewFromModel()
    }
    
    @IBAction func addThreeNewCards() {
        setGame.addCards(numberOfCardsToSelect: 3)
        updateViewFromModel()
        if setGame.cardsInGame.count >= 24 {
            dealThreeMoreCardsButton.isEnabled = false
        }
    }
    
    private func updateViewFromModel() {
        var cardButtonIndex = 0
        resetButtons()
        scoreLabel.text = "Score: \(setGame.score)"
        for card in setGame.cardsInGame {
            let button = setCardButtons[cardButtonIndex]
            ButtonRender.renderCard(cardToRender: card,
                                    onButton: button,
                                    selectButton: setGame.cardIsSelected(card: card),
                                    isSet: setGame.isSet())
            cardButtonIndex += 1
        }
    }
}
