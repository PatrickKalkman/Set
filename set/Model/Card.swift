//
//  Card.swift
//  set
//
//  Created by Patrick Kalkman on 19/01/2018.
//  Copyright © 2018 SimpleTechture. All rights reserved.
//

import Foundation

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
