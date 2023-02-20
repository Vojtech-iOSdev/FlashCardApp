//
//  MyReviewButton.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 14.02.2023.
//

import SwiftUI

struct MyReviewButton: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel
    
    var stackPosition: Int
    @State var isAnimatedCorrect: Bool = false
    @State var isAnimatedWrong: Bool = false
        
    var body: some View {
        
        Button{
            withAnimation(Animation.default) {
                checkForAnswer()
            }
            viewModel.disableButton = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                viewModel.gridWords = []
                viewModel.createCardPosition()
                viewModel.generateGridWordsRandomPosition()
                isAnimatedCorrect = false
                isAnimatedWrong = false
                viewModel.disableButton = false
            }

        } label: {
            Text(viewModel.deckBack[stackPosition])
                
                .font(.system(.headline, design: .rounded, weight: .heavy))
                .frame(width: 165, height: 165, alignment: .center)
                .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
                .frame(width: 165, height: 165, alignment: .center)
                .background(isAnimatedCorrect ? Color.green.opacity(1) : Color.white.opacity(0))
                .background(isAnimatedWrong ? Color.red.opacity(1) : Color.white.opacity(0))
                    
        }.disabled(viewModel.disableButton)
               
    }
    func checkForAnswer() {
        if stackPosition == viewModel.gridWords[viewModel.gridWordsRandomPosition] {
            isAnimatedCorrect = true
            viewModel.correctCounter += 1
        }else{
            isAnimatedWrong = true
            viewModel.wrongCounter += 1

        }
        
    }
}

struct MyReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        MyReviewButton(stackPosition: 0)
            .environmentObject(EnvironmentViewModel())
    }
}
