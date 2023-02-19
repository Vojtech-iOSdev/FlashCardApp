//
//  ViewModel.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 11.02.2023.
//

import SwiftUI

class EnvironmentViewModel:ObservableObject {
    
    @Published var deckFront: [String] = [
        "apple", "pear", "orange", "pumpkin", "banana"
    ]
    
    @Published var deckBack:[String] = [
        "jablko", "hruška", "pomeranč", "dýně", "banán"
    ]
    
   // @Published var randomNumber: Int = 0
    @Published var flipped:Bool = false
    
    @Published var gridWords: [Int] = [0, 0, 0, 0]
    @Published var gridWordsRandomPosition: Int = 0

    
    @Published var cardPosition: Int = 0
    @Published var cardPosition2: Int = 0
    @Published var cardPosition3: Int = 0
    @Published var cardPosition4: Int = 0
    
    
    init() {
        

        
    }
    
    func generateGridWordsRandomPosition() {
        gridWordsRandomPosition = Int.random(in: 0...3)
    }

    func createCardPosition() {
        //viewModel.gridWords = []
        cardPosition = Int.random(in: 0...deckFront.count-1)
        cardPosition2 = Int.random(in: 0...deckFront.count-1)
        cardPosition3 = Int.random(in: 0...deckFront.count-1)
        cardPosition4 = Int.random(in: 0...deckFront.count-1)
        
        
        if cardPosition == cardPosition2 {
            cardPosition = Int.random(in: 0...deckFront.count-1)
        }
        if cardPosition == cardPosition3{
            cardPosition = Int.random(in: 0...deckFront.count-1)
        }
        if cardPosition == cardPosition4{
            cardPosition = Int.random(in: 0...deckFront.count-1)
        }
        if cardPosition2 == cardPosition3{
            cardPosition2 = Int.random(in: 0...deckFront.count-1)
        }
        if cardPosition2 == cardPosition4{
            cardPosition2 = Int.random(in: 0...deckFront.count-1)
        }
        if cardPosition3 == cardPosition4{
            cardPosition3 = Int.random(in: 0...deckFront.count-1)
        }
        gridWords.append(cardPosition)
        gridWords.append(cardPosition2)
        gridWords.append(cardPosition3)
        gridWords.append(cardPosition4)

    }
    
 }




