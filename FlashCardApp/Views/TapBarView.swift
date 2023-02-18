//
//  TapBarView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 11.02.2023.
//

import SwiftUI

struct TapBarView: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    @State var selectedIndex:Int = 0
    @State private var presented:Bool = false
    
    //@Binding var gridWords: [Int]
    //@Binding var cardPosition: Int
    //@Binding var cardPosition2: Int
    //@Binding var cardPosition3: Int
    //@Binding var cardPosition4: Int
    
    
    let icons = [
        "graduationcap",
        "plus.app",
        "text.book.closed"
    ]
    
    let texts = [
        "study",
        "create",
        "review"
    ]
    
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
            }.ignoresSafeArea()
            
            VStack {
                
                //content
                ZStack {
                    
                    Spacer().fullScreenCover(isPresented: $presented) {
                        CreateView(presented: $presented)
                        
                    }
                    
                    switch selectedIndex {
                    case 0:
                        StudyView()
                        
                    case 1:
                        CreateView(presented: $presented)
                        
                    default:
                        ReviewView()
                        
                        
                    }
                    
                }.environmentObject(viewModel)
                
                
                //Spacer()
                
                //Divider()
                
                HStack(spacing: 20){
                    ForEach(0..<3, id: \.self) {number in
                        
                        //Spacer()
                        
                        Button {
                            if number == 1 {
                                presented.toggle()
                            }
                            else{
                                self.selectedIndex = number
                            }
                        } label: {
                            
                            VStack(alignment: .center, spacing: 2){
                                
                                Image(systemName: icons[number])
                                    .resizable()
                                    .scaledToFit()
                                    .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                                    .foregroundColor(selectedIndex == number ? Color.white.opacity(2) : Color.white.opacity(0.8))
                                    .frame(width: 40, height: 40)
                                
                                
                                
                                Text(texts[number])
                                    .font(.system(.headline, design: .rounded, weight: .heavy))
                                    .foregroundColor(selectedIndex == number ? Color.white.opacity(2) : Color.white.opacity(0.8))
                                
                                
                            }
                            .frame(width: 100, height: 80, alignment: .center)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            
                            .cornerRadius(10)
                        }
                        
                        // Spacer()
                    }
                }
                
            }
        }
        
    }
}

struct TapBarView_Previews: PreviewProvider {
    static var previews: some View {
        TapBarView()
    }
}


//   .frame(width: 350, height: 82)
//   .fontWeight(.semibold)
// .foregroundStyle(.linearGradient(colors: [Color.white.opacity(0.8)], startPoint: .top, endPoint: .bottom))
//  .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
