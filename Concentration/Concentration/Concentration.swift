//
//  Concentration.swift
//  Concentration
//
//  Created by Deeksha Kaul on 26/09/18.
//  Copyright © 2018 Deeksha Kaul. All rights reserved.
//

import Foundation

class Concentration{
    
    private(set) var cards = [Card]()
    
    private var indexOfSingleFaceUpCard: Int? {
        get{
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFaceUp == true{
                    if foundIndex == nil{
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index:Int){
        assert(cards.indices.contains(index),"chooseCard method ... index not found\(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfSingleFaceUpCard , matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            }else{
                indexOfSingleFaceUpCard = index
            }
        }
    }
    
    init(noOfPairsOfCards: Int){
        assert(noOfPairsOfCards>0,"init... at least 1 pair should be present") // ensure the code doesn't crash unexpectedly
        for _ in 1...noOfPairsOfCards{
            let card  = Card()
            cards += [card,card]
        }
    }
    
}
