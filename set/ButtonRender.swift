//
//  ButtonRender.swift
//  set
//
//  Created by Patrick Kalkman on 19/01/2018.
//  Copyright © 2018 SimpleTechture. All rights reserved.
//

import Foundation
import UIKit

class ButtonRender {
    
    private static func getSymbol(ofCard card: Card) -> String {
        switch card.cardSymbol {
        case .diamond:
            return "▲"
        case .oval:
            return "●"
        case .squiggle:
            return "◼︎"
        }
    }
    
    private static func getColor(ofCard card: Card) -> UIColor {
        switch card.cardColor {
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        case .purple:
            return UIColor.purple
        }
    }
    
    private static func getButtonTitle(ofCard card: Card, usingSymbol symbol: String) -> String {
        switch card.cardNumber {
        case .one:
            return symbol
        case .two:
            return "\(symbol) \(symbol)"
        case .three:
            return "\(symbol) \(symbol) \(symbol)"
        }
    }
    
    private static func getButtonAttributedTitle(ofCard card: Card, withTitle title: String, withColor color: UIColor) -> NSAttributedString {
        
        var attributes: [NSAttributedStringKey: Any] = [:]
        
        switch card.cardShading {
        case .open:
            attributes[.strokeWidth] = 4
            attributes[.foregroundColor] = color
        case .solid:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color
        case .striped:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color.withAlphaComponent(0.15)
        }
        
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    public static func renderCard(cardToRender card: Card, onButton: UIButton, selectButton: Bool) {
        
        onButton.isHidden = false
        let buttonColor = getColor(ofCard: card)
        let cardSymbol = getSymbol(ofCard: card)
        let buttonTitle = getButtonTitle(ofCard: card, usingSymbol: cardSymbol)
        let attributedTitle = getButtonAttributedTitle(ofCard: card, withTitle: buttonTitle, withColor: buttonColor)
        
        onButton.setAttributedTitle(attributedTitle, for: UIControlState.normal)
        
        if selectButton {
            onButton.select()
        } else {
            onButton.deselect()
        }
    }
}
