//
//  EditDeckView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 19.02.2023.
//

import SwiftUI

struct EditDeckView: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var createEditDeckScreen: Bool
    
    var body: some View {
        ZStack {
            
            Background
            
            Button {
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                MyButton(title: "back", titleIcon: "arrow.uturn.left")
                
            }.offset(x: -100, y:-330)
            
            VStack {
                
                Spacer()
                
                Label("FlashCardDeck", systemImage: "arrowtriangle.down.square")
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .frame(width: 170, height: 40, alignment: .center)
                    .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
                    .offset(y: 130)
                
                #warning("list element")
                List {
                    ForEach(viewModel.deckFront, id: \.self) {card in
                        Text(card)
                        
                    }
                }
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.width)
                .background(Color.white.opacity(0))
                
                
            }
            VStack {
                Text("wtffff")
            }
            
        }
    }
}

struct EditDeckView_Previews: PreviewProvider {
    static var previews: some View {
        EditDeckView(createEditDeckScreen: .constant(false))
            .environmentObject(EnvironmentViewModel())
            
    }
}

extension EditDeckView {
    
    private var Background: some View {
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
        
    }
}
