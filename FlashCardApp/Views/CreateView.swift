//
//  CreateView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 10.02.2023.
//

import SwiftUI

struct CreateView: View {
    
    @Binding var presented: Bool
    @State var createNewCardScreen: Bool = false
    
    var body: some View {
        
        ZStack {
            
            ZStack{
                LinearGradient(colors: [Color.orange.opacity(0.8), Color.orange.opacity(0.4)], startPoint: .topTrailing, endPoint: .bottomLeading)
                
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
            
            
            ZStack {
                Button {
                    presented.toggle()
                } label: {
                    MyButton(title: "back", titleIcon: "arrow.uturn.left")
                    
                    
                }.offset(x: -100, y:-330)
            }
            
            VStack(spacing: 120) {
                
                Button {
                    createNewCardScreen.toggle()
                } label: {
                    Text("create new card")
                        .padding()
                        .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                        .frame(width: 320, height: 100, alignment: .center)
                        .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                
                
                
                
                Button {
                    
                } label: {
                    Text("create new deck")
                        .padding()
                        .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                        .frame(width: 320, height: 100, alignment: .center)
                        .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    
                }
                
                
                
                
                
                
            }.padding(.top)
            
            
            if createNewCardScreen {
                CreateCardView(createNewCardScreen: $createNewCardScreen)
                    .transition(.move(edge: .bottom))
            }
            
        }//.navigationTitle("createView")

    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView(presented: .constant(true))
    }
}