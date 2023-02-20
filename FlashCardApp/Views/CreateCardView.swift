//
//  CreateCardView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 12.02.2023.
//

import SwiftUI


struct CreateCardView: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel
    
    @State var newFront: String = ""
    @State var newBack: String = ""
    
    @Binding var presented: Bool
    
    var body: some View {
        ZStack {
            
            Background
            
            Button {
                presented.toggle()
                
            } label: {
                MyButton(title: "back", titleIcon: "arrow.uturn.left")
                
            }.offset(x: -100, y:-330)
            
#warning("add new card buttons")
            VStack(spacing: 40){
                
                MyTextField(textFieldTitle: "The card front is:", textFieldText: $newFront)
                
                MyTextField(textFieldTitle: "The card back is:", textFieldText: $newBack)
                
#warning ("save new card button")
                Button {
                    saveNewCard()
                    
                } label: {
                    MyButton(title: "save", titleIcon: "folder.badge.plus")
                    
                }
                
                
            }.offset(y: 30)
            
        }
    }
    func saveNewCard() {
        viewModel.deckFront.append(newFront)
        viewModel.deckBack.append(newBack)
        newFront = ""
        newBack = ""
    }
}

struct CreateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCardView(presented: .constant(false))
    }
}

struct MyTextField: View {
    
    var textFieldTitle: String
    var textFieldText: Binding<String>
    
    var body: some View {
        
        TextField(textFieldTitle, text: textFieldText)
            .padding()
            .font(.system(.largeTitle, design: .rounded, weight: .heavy))
            .frame(width: 360, height: 250, alignment: .center)
            .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 80, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 0)
            .lineLimit(1)
    }
}

extension CreateCardView {
    
    private var Background: some View {
        ZStack{
            LinearGradient(colors: [Color.orange.opacity(0.8), Color.orange.opacity(0.5)], startPoint: .topTrailing, endPoint: .bottomLeading)
            
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
