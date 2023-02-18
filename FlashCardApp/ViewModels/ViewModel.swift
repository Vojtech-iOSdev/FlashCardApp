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
    
    @Published var gridWords: [Int] = [0, 0, 0, 0]
    @Published var gridWordsRandomPosition: Int = 0

    
    @Published var cardPosition: Int = 0
    @Published var cardPosition2: Int = 0
    @Published var cardPosition3: Int = 0
    @Published var cardPosition4: Int = 0
    
    
    init() {
        
//        getData()
//        createRandomNumber()
        
    }
    
    func generateGridWordsRandomPosition() {
        gridWordsRandomPosition = Int.random(in: 0...3)
    }
//        func getData() {
//            deckFront.append("hi")
//            deckBack.append("hello")
//
//        }
    
//     func saveNewCard() {
//         deckFront.append(newFront)
//         deckBack.append(newBack)
//         //dataArray.append(newBack)
// 
//         newFront = ""
//         newBack = ""
//     }
    
    
 }




