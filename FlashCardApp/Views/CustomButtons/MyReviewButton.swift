//
//  MyReviewButton.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 14.02.2023.
//

import SwiftUI

struct MyReviewButton: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel
    //var reviewedWord:String
    //@State var cardPosition: Int = 0
    //@State var cardPosition2: Int = 0
    //@State var cardPosition3: Int = 0
    //@State var cardPosition4: Int = 0
    //@State var gridWords: [Int] = []
    var stackPosition: Int
    @State var isAnimated: Bool = false
    //@State private var counter: Int = 0
    
    
    var body: some View {
        
        Button{
            //ACTION FOR BUTTON LATER
            viewModel.gridWords = []
            createCardPosition()
            viewModel.generateGridWordsRandomPosition()
            checkForAnswer()
            

            
        } label: {
            Text(viewModel.deckBack[stackPosition])
                
                .font(.system(.headline, design: .rounded, weight: .heavy))
                .frame(width: 165, height: 165, alignment: .center)
                .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .frame(width: 165, height: 165, alignment: .center)
                .background(isAnimated ? Color.green.opacity(1) : Color.white.opacity(0))
            
            
//                .pressEvents(onPress: {
//                    withAnimation(.easeIn(duration: 0.1)) {
//                        isAnimated = true
//                    }
//                }, onRelease: {
//                    withAnimation {
//                        isAnimated = false
//                    }
//                })
                    
        }
               
    }
    func createCardPosition() {
        //viewModel.gridWords = []
        viewModel.cardPosition = Int.random(in: 0...viewModel.deckFront.count-1)
        viewModel.cardPosition2 = Int.random(in: 0...viewModel.deckFront.count-1)
        viewModel.cardPosition3 = Int.random(in: 0...viewModel.deckFront.count-1)
        viewModel.cardPosition4 = Int.random(in: 0...viewModel.deckFront.count-1)
        
        
        if viewModel.cardPosition == viewModel.cardPosition2 {
            viewModel.cardPosition = Int.random(in: 0...viewModel.deckFront.count-1)
        }
        if viewModel.cardPosition == viewModel.cardPosition3{
            viewModel.cardPosition = Int.random(in: 0...viewModel.deckFront.count-1)
        }
        if viewModel.cardPosition == viewModel.cardPosition4{
            viewModel.cardPosition = Int.random(in: 0...viewModel.deckFront.count-1)
        }
        if viewModel.cardPosition2 == viewModel.cardPosition3{
            viewModel.cardPosition2 = Int.random(in: 0...viewModel.deckFront.count-1)
        }
        if viewModel.cardPosition2 == viewModel.cardPosition4{
            viewModel.cardPosition2 = Int.random(in: 0...viewModel.deckFront.count-1)
        }
        if viewModel.cardPosition3 == viewModel.cardPosition4{
            viewModel.cardPosition3 = Int.random(in: 0...viewModel.deckFront.count-1)
        }
        viewModel.gridWords.append(viewModel.cardPosition)
        viewModel.gridWords.append(viewModel.cardPosition2)
        viewModel.gridWords.append(viewModel.cardPosition3)
        viewModel.gridWords.append(viewModel.cardPosition4)

    }
    
    func checkForAnswer() {
        if stackPosition == viewModel.gridWords[viewModel.gridWordsRandomPosition] {
            isAnimated = true
        }else{
            isAnimated = false
        }
    }
}

struct MyReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewButton(stackPosition: 0)
            .environmentObject(EnvironmentViewModel())
    }
}
