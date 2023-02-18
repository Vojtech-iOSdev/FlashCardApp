//
//  CreateCardView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 12.02.2023.
//

import SwiftUI


struct CreateCardView: View {
    
    @EnvironmentObject var viewModel:EnvironmentViewModel
    
    @Binding var createNewCardScreen: Bool
    @State var newFront: String = ""
    @State var newBack: String = ""
    
    @State var dataArray: [String] = []

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
            
            Button {
                createNewCardScreen.toggle()
                
            } label: {
                MyButton(title: "back", titleIcon: "arrow.uturn.left")

            }.offset(x: -100, y:-330)
            
            VStack(spacing: 40){
                TextField("The card front is:", text: $newFront)
                    .padding()
                    .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                    .frame(width: 360, height: 250, alignment: .center)
                    .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 80, style: .continuous))
                    .lineLimit(1)
                
                TextField("The card back is:", text: $newBack)
                    .padding()
                    .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                    .frame(width: 360, height: 250, alignment: .center)
                    .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 80, style: .continuous))
                    .lineLimit(1)
                
                #warning ("save new card button here")
                //SaveNewCard(newFront: $newFront, newBack: $newBack)

                Button {
                    saveNewCard()

                } label: {
                    MyButton(title: "save", titleIcon: "folder.badge.plus")

                }
                
               // ForEach (viewModel.deckFront, id: \.self) { data in
               //     Text(data)
               // }
                
            }.offset(y: 30)
            
        }
    }
    func saveNewCard() {
        viewModel.deckFront.append(newFront)
        viewModel.deckBack.append(newBack)
        //dataArray.append(newBack)

        newFront = ""
        newBack = ""
    }
}

struct CreateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCardView(createNewCardScreen: .constant(false))
    }
}
