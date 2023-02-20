//
//  ContentView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 28.01.2023.
//

import SwiftUI

struct StudyView: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel
    
    @State var deckFrontPosition: Int = 0
    @State var deckBackPosition: Int = 0
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Background
                
                VStack {
                    
                    Spacer()
                    
#warning ("deck menu")
                    VStack{
                        
                        Text("Free Flash Cards")
                            .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                            .frame(width: 350, height: 100, alignment: .center)
                            .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
                            .underline()
                    }
                    
                    Spacer()
                    
#warning ("flashCard element")
                    VStack {
                        Button {
                            viewModel.flipped.toggle()
                        } label: {
                            if viewModel.flipped == false {
                                FlashCardView(language: "english", cardWord: viewModel.deckFront[deckFrontPosition])
                                
                            }else {
                                FlashCardView(language: "czech", cardWord: viewModel.deckBack[deckBackPosition])
                                
                            }
                        }
                    }
                    .frame(width: 360, height: 250, alignment: .center)
                    .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 80, style: .continuous))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 30){
                        
                        Spacer()
                        
#warning("LAST BUTTON")
                        Button {
                            showLastCard()
                            
                        } label: {
                            
                            MyButton(title: "last", titleIcon: "arrow.uturn.left")
                        }
                        
#warning("NEXT BUTTON")
                        Button {
                            showNextCard()
                            
                        } label: {
                            
                            MyButton(title: "next", titleIcon: "arrowshape.forward")
                        }
                        
                        Spacer()
                        
                    }.padding(.bottom)
                    
                    Spacer()
                    
                }
                .padding()
                
            }
        }
        
    }
    func showLastCard() {
        if  deckFrontPosition < 1 && deckBackPosition < 1{
            
            deckFrontPosition = 0
            deckBackPosition = 0
        }
        
        else{
            deckFrontPosition -= 1
            deckBackPosition -= 1
        }
    }
    
    func showNextCard() {
        if viewModel.flipped == true {
            viewModel.flipped = false
            if  deckFrontPosition < viewModel.deckFront.count-1 && deckBackPosition < viewModel.deckFront.count-1{
                
                deckFrontPosition += 1
                deckBackPosition += 1
            }
            
            else if deckFrontPosition == viewModel.deckFront.count-1 && deckBackPosition == viewModel.deckFront.count-1{
                
            }
            
        }else {
            if  deckFrontPosition < viewModel.deckFront.count-1 && deckBackPosition < viewModel.deckFront.count-1{
                
                deckFrontPosition += 1
                deckBackPosition += 1
            }
            
            else if deckFrontPosition == viewModel.deckFront.count-1 && deckBackPosition == viewModel.deckFront.count-1{
                
            }
        }
    }
}

struct StudyView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView()
            .environmentObject(EnvironmentViewModel())
    }
}

extension StudyView {
    
    private var Background: some View {
        
        ZStack{
            LinearGradient(colors: [Color.orange.opacity(0.8), Color.orange.opacity(0.5)], startPoint: .topTrailing, endPoint: .bottomLeading)
            
            Circle()
                .frame(width: 400)
                .foregroundColor(Color.orange.opacity(0.5))
                .blur(radius: 16)
                .offset(x: -180, y: 50)
            
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .frame(width: 700, height: 320)
                .foregroundColor(Color.orange.opacity(0.6))
                .offset(x: 80, y: -305)
                .blur(radius: 30)
                .rotationEffect(Angle(degrees: 115))
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
                .foregroundColor(Color.orange.opacity(0.8))
                .rotationEffect(Angle(degrees: 45))
                .offset(x: 100, y: -260)
                .blur(radius: 30)
            
        }.ignoresSafeArea()
    }
}


