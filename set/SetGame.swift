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
    
    init() {
        generateAllCardCombinations()
        print("Generated \(availableCards.count) cards")
        shuffleCards()
        selectCards(numberOfCardsToSelect: 12)
        print("Selected \(cardsInGame.count) cards")
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
    
    func selectCards(numberOfCardsToSelect numberOfCards: Int) {
        assert(numberOfCards <= availableCards.count, "SetGame.selectCards(numberOfCardss: \(numberOfCards)): number Of cards to select should be less or equal than the available cards")
        for _ in 0..<numberOfCards {
            selectCard()
        }
    }
    
    func shuffleCards() {
        // TODO: implement shuffle cards
    }
    
    private func selectCard() {
        let selectedCard = availableCards.remove(at: availableCards.count.arc4Random())
        cardsInGame.append(selectedCard)
    }
}

struct Card {
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
