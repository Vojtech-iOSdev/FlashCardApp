//
//  ReviewView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 10.02.2023.
//

import SwiftUI

struct ReviewView: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel

    //let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
   
    //@Binding var gridWords: [Int]
    
    //@Binding var cardPosition: Int
    //@Binding var cardPosition2: Int
    //@Binding var cardPosition3: Int
    //@Binding var cardPosition4: Int
    //var cardPosition: Int = viewModel.randomNumber
    
    
    var body: some View {
        
        ZStack {
            
            ZStack{
                LinearGradient(colors: [Color.orange.opacity(0.2), Color.orange.opacity(0.1)], startPoint: .topTrailing, endPoint: .bottomLeading)
                
                Circle()
                    .frame(width: 400)
                    .foregroundColor(Color.orange.opacity(0.4))
                    .blur(radius: 16)
                    .offset(x: -180, y: 50)
                
                RoundedRectangle(cornerRadius: 32, style: .continuous)
                    .frame(width: 700, height: 320)
                    .foregroundColor(Color.orange.opacity(0.5))
                    .offset(x: 80, y: -305)
                    .blur(radius: 30)
                    .rotationEffect(Angle(degrees: 115))
                
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
                    .foregroundColor(Color.orange.opacity(0.6))
                    .rotationEffect(Angle(degrees: 45))
                    .offset(x: 100, y: -260)
                    .blur(radius: 30)
                
            }.ignoresSafeArea()
            
            VStack{
                
                Spacer()

                HStack(spacing: 15) {
                    
                    //MyButton2(title: viewModel.deckBack[viewModel.cardPosition])
                    MyButton2(title: viewModel.deckFront[viewModel.gridWords[viewModel.gridWordsRandomPosition]])
                    
                    Text("change deck")

                    
                }.padding(.horizontal)
                
                
                Spacer()
                
                //#warning("DYNAMIC TIMER TUTORIAL")
                
                VStack(spacing: 15){
                    HStack(spacing: 15){
                        //MyCorrectReviewButton(stackPosition2: viewModel.cardPosition)
                        
                        //MyReviewButton(stackPosition: viewModel.cardPosition)
                        //MyReviewButton(stackPosition: viewModel.cardPosition2)
                        MyReviewButton(stackPosition: viewModel.gridWords[0])
                        MyReviewButton(stackPosition: viewModel.gridWords[1])
                    }
                    
                    HStack(spacing: 15){
                        //MyReviewButton(stackPosition: viewModel.cardPosition3)
                        //MyReviewButton(stackPosition: viewModel.cardPosition4)
                        MyReviewButton(stackPosition: viewModel.gridWords[2])
                        MyReviewButton(stackPosition: viewModel.gridWords[3])
                    }
                }
                
//                LazyVGrid(columns: columns, spacing: 20) {
//
//                    ForEach(viewModel.gridWords, id: \.self) { word in
//                        MyReviewButton(stackPosition: viewModel.cardPosition)
//
//
//                    }
//
//                }
//                .padding(.horizontal, 5)
//                .frame(width: 390)
                
               
                Spacer()

            }
        }
        
        
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
            .environmentObject(EnvironmentViewModel())
    }
}