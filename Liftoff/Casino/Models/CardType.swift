// assign values to suits to make Comparable
enum Suit: Int, CaseIterable {
    case s = 0
    case h = 1
    case d = 2
    case c = 3
}

import Foundation

struct CardType: Identifiable, Equatable, Comparable {
    //set id based on combo of card rank and suit
    var id: String {
        return String(rank) + String(describing: suit)
    }
    var rank:Int
    var suit:Suit
    //image names formatted as "rank_of_suit"
    var imageName:String {
        String(rank) + "_of_" + String(describing: suit)}
    
    static var cardTypes: [CardType] {
        var cardTypes: [CardType] = []
        // create a card for each rank in each suit
        for suit in Suit.allCases {
            for rank in 2...14 {
                let card = CardType(rank: rank, suit: suit)
                // add card to the deck
                cardTypes.append(card)
            }
        }
        return cardTypes
    }
    // compare cards
    static func < (lhs: CardType, rhs: CardType) -> Bool {
        if lhs.rank == rhs.rank {
            return lhs.suit.rawValue < rhs.suit.rawValue
        } else {
            print(lhs.rank < rhs.rank)
            return lhs.rank < rhs.rank
        }
    }
}
