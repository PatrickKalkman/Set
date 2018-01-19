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
    
    func select(card: Card) {
        if selectedCards.count == 3 {
            selectedCards = [Card]()
        }
        
        if let cardToSelect = selectedCards.index(of: card) {
            // Card is already selected, so remove it from the selection
            selectedCards.remove(at: cardToSelect)
        } else {
            if let cardToSelect = cardsInGame.index(of: card) {
                selectedCards.append(cardsInGame[cardToSelect])
            }
        }

        print("Selected \(selectedCards.count) cards")
    }
}

struct Card : Equatable {
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.cardColor == rhs.cardColor &&
            lhs.cardNumber == rhs.cardNumber &&
            lhs.cardShading == rhs.cardShading &&
            lhs.cardSymbol == rhs.cardSymbol
    }
    
    let cardColor: CardColor
    let cardSymbol: CardSymbol
    let cardNumber: CardNumber
    let cardShading: CardShading
}

enum CardColor {
    case red
    case green
    case purple
    
    static let allValues = [red, green, purple]
}

enum CardSymbol {
    case diamond
    case squiggle
    case oval
    
    static let allValues = [diamond, squiggle, oval]
}

enum CardNumber {
    case one
    case two
    case three
    
    static let allValues = [one, two, three]
}

enum CardShading {
    case solid
    case striped
    case open
    
    static let allValues = [solid, striped, open]
}
