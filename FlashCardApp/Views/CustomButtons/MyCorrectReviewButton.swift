//
//  MyCorrectReviewButton.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 15.02.2023.
//

import SwiftUI

struct MyCorrectReviewButton: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel
    var stackPosition2: Int

    
    var body: some View {
        
        Button{
            //ACTION FOR BUTTON LATER
            createCardPosition()
            
        } label: {
            Text(viewModel.deckBack[stackPosition2])
                
                .font(.system(.headline, design: .rounded, weight: .heavy))
                .frame(width: 165, height: 165, alignment: .center)
                .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
               
    }
    func createCardPosition() {
        //viewModel.gridWords = []
        viewModel.cardPosition = Int.random(in: 0...viewModel.deckFront.count-1)
        viewModel.cardPosition2 = Int.random(in: 0...viewModel.deckFront.count-1)
        viewModel.cardPosition3 = Int.random(in: 0...viewModel.deckFront.count-1)
        viewModel.cardPosition4 = Int.random(in: 0...viewModel.deckFront.count-1)
        
        
        
    }
}

struct MyCorrectReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        MyCorrectReviewButton(stackPosition2: 0)
            .environmentObject(EnvironmentViewModel())

    }
}
