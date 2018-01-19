//
//  SetGame.swift
//  set
//
//  Created by Patrick Kalkman on 19/01/2018.
//  Copyright © 2018 SimpleTechture. All rights reserved.
//

import Foundation

class SetGame {
    var availableCards = [Card]()
    var cardsInGame = [Card]()
    var selectedCards = [Card]()
    
    init() {
        newGame()
    }
    
    func newGame() {
        availableCards.removeAll()
        cardsInGame.removeAll()
        selectedCards.removeAll()
        
        generateAllCardCombinations()
        print("Generated \(availableCards.count) cards and added them to deck")
        addCards(numberOfCardsToSelect: 12)
        print("Add \(cardsInGame.count) cards from deck to game")
    }
    
    private func generateAllCardCombinations() {
        for color in CardColor.allValues {
            for symbol in CardSymbol.allValues {
                for number in CardNumber.allValues {
                    for shading in CardShading.allValues {
                        let card = Card(cardColor: color, cardSymbol: symbol, cardNumber: number, cardShading: shading)
                        availableCards.append(card)
                    }
                }
            }
        }
    }
    
    private func addCard() {
        let selectedCard = availableCards.remove(at: availableCards.count.arc4Random())
        cardsInGame.append(selectedCard)
    }
    
    func addCards(numberOfCardsToSelect numberOfCards: Int) {
        assert(numberOfCards <= availableCards.count, "SetGame.selectCards(numberOfCardss: \(numberOfCards)): number Of cards to select should be less or equal than the available cards")
        for _ in 0..<numberOfCards {
            addCard()
        }
    }
    
    func cardIsSelected(card: Card) -> Bool {
        return selectedCards.index(of: card) != nil
    }
    
    func isSet() -> Bool {
        //If two are... and one is not, then it is not a 'Set'.
        if selectedCards.count != 3 {
            return false
        }
        
        if selectedCards[0].cardColor == selectedCards[1].cardColor {
            if selectedCards[0].cardColor != selectedCards[2].cardColor {
                return false
            }
        } else if selectedCards[1].cardColor == selectedCards[2].cardColor {
            return false
        } else if (selectedCards[0].cardColor == selectedCards[2].cardColor) {
            return false
        }
        
        if selectedCards[0].cardNumber == selectedCards[1].cardNumber {
            if selectedCards[0].cardNumber != selectedCards[2].cardNumber {
                return false
            }
        } else if selectedCards[1].cardNumber == selectedCards[2].cardNumber {
            return false
        } else if (selectedCards[0].cardNumber == selectedCards[2].cardNumber) {
            return false
        }
        
        if selectedCards[0].cardShading == selectedCards[1].cardShading {
            if selectedCards[0].cardShading != selectedCards[2].cardShading {
                return false
            }
        } else if selectedCards[1].cardShading == selectedCards[2].cardShading {
            return false
        } else if (selectedCards[0].cardShading == selectedCards[2].cardShading) {
            return false
        }
        
        if selectedCards[0].cardSymbol == selectedCards[1].cardSymbol {
            if selectedCards[0].cardSymbol != selectedCards[2].cardSymbol {
                return false
            }
        } else if selectedCards[1].cardSymbol == selectedCards[2].cardSymbol {
            return false
        } else if (selectedCards[0].cardSymbol == selectedCards[2].cardSymbol) {
            return false
        }
        
        return true
    }
    
    func select(card: Card) {
        if selectedCards.count == 3 {
            selectedCards = [Card]()
        }
        
        if let cardToSelect = selectedCards.index(of: card) {
            // Card is already selected, so remove it from the selection
            selectedCards.remove(at: cardToSelect)
        } else {
            //if let cardToSelect = cardsInGame.index(of: card) {
                selectedCards.append(card)
            //}
        }
        
        print("Selected \(selectedCards.count) cards")
    }
}


