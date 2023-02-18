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
//    @State var positionForComparison = viewModel.deckFront.count-1

    
    var body: some View {
        
        NavigationView {
            ZStack {
                
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
                
                VStack {
                    
                    Spacer()
                    
                    HStack{
                        
                        Text("deckname")
                            .font(.system(.headline, design: .rounded, weight: .semibold))
                            .frame(width: 150, height: 40, alignment: .center)
                            .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                        
                        //tap bar elemennt with all decks available, nejlepe kdyby slo kliknout na cely text aby to bylo lehke na zmacknuti a nemusel to byt HStack a bylo by to hezky schovany ale potrebovalo by to nejaky indikator!!!
                        
                        
                    }
                    
                    Spacer()
                    
                    #warning ("flashCard element :))")
                    VStack {
                        
                        Card(deckFrontPosition: $deckFrontPosition, deckBackPosition: $deckBackPosition)
                        
                        
                        //Image(systemName: "square")
                        
                    }
                    .padding()
                    .frame(width: 360, height: 250, alignment: .center)
                    .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 80, style: .continuous))
                    
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 30){
                        
                        Spacer()
                        
                        //LAST BUTTON
                        Button {
                            if  deckFrontPosition < 1 && deckBackPosition < 1{
                                
                                deckFrontPosition = 0
                                deckBackPosition = 0
                            }
                            
                            else{
                                deckFrontPosition -= 1
                                deckBackPosition -= 1
                            }
                        } label: {
                            
                            MyButton(title: "last", titleIcon: "arrow.uturn.left")
                        }
                        
                        //NEXT BUTTON
                        Button {
                            // funkční
                           if  deckFrontPosition < viewModel.deckFront.count-1 && deckBackPosition < viewModel.deckFront.count-1{

                               deckFrontPosition += 1
                               deckBackPosition += 1
                           }
                            
                           else if deckFrontPosition == viewModel.deckFront.count-1 && deckBackPosition == viewModel.deckFront.count-1{

                           }
                            
                            
                            
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StudyView()
            .environmentObject(EnvironmentViewModel())
    }
}


