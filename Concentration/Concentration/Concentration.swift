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
    
    private(set) var matchedPairs = 0
    
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
    
    func chooseCard(at index:Int) -> Card{
        print("card clicked",cards[index])
        assert(cards.indices.contains(index),"chooseCard method ... index not found\(index)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfSingleFaceUpCard , matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    print("in if matching condition...")
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    matchedPairs += 1
                    cards[matchIndex].shouldHide = true
                    cards[index].shouldHide = true
                    print(matchedPairs,"is the no of pairs already matched")
                }
                cards[index].isFaceUp = true
            }else{
                indexOfSingleFaceUpCard = index
            }
        }
        return cards[index]
    }
    
    init(noOfPairsOfCards: Int){
        assert(noOfPairsOfCards>0,"init... at least 1 pair should be present") // ensure the code doesn't crash unexpectedly
        for _ in 1...noOfPairsOfCards{
            let card  = Card()
            cards += [card,card]
        }
    }
    
}
