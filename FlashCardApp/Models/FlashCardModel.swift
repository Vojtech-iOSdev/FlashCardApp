//
//  FlashCardModel.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 31.01.2023.
//

import SwiftUI



struct Card: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel

    
    @State var flipped:Bool = false
    @Binding var deckFrontPosition: Int
    @Binding var deckBackPosition: Int
    
    var body: some View {
        
        Button {
            flipped.toggle()
        } label: {
            if flipped == false {
                Text(viewModel.deckFront[deckFrontPosition]).font(.system(.largeTitle, design: .rounded, weight: .bold))
            }
            else {
                Text(viewModel.deckBack[deckBackPosition]).font(.system(.largeTitle, design: .rounded, weight: .bold))
            }
        }
        
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(deckFrontPosition: .constant(0), deckBackPosition: .constant(0))
            .environmentObject(EnvironmentViewModel())
    }
}



//struct CardStruct2 {
//
//    let front: String
//    let back: String
//}
//
//struct Deck {
//
//    static let Cards = [
//        Card(front: "hello", back: "ahoj"),
//        Card(front: "thank you", back: "děkuju"),
//        Card(front: "please", back: "prosím"),
//        Card(front: "bye", back: "ahoj (při loučení)"),
//        Card(front: "and", back: "a"),
//        Card(front: "name", back: "jméno"),
//        Card(front: "car", back: "auto"),
//        Card(front: "river", back: "řeka"),
//        Card(front: "street", back: "silnice"),
//        Card(front: "forest", back: "les"),
//        Card(front: "bus", back: "autobus"),
//        Card(front: "play", back: "hrát"),
//        Card(front: "bread", back: "chleba"),
//        Card(front: "house", back: "barák"),
//        Card(front: "door", back: "dveře"),
//        Card(front: "window", back: "okno"),
//        Card(front: "table", back: "stůl"),
//        Card(front: "chair", back: "židle"),
//        Card(front: "dog", back: "pes"),
//        Card(front: "cat", back: "kočka")
//
//    ]
//}

