//
//  MyButton.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 11.02.2023.
//

import SwiftUI



struct MyButton: View {
    
    var title: String
    var titleIcon: String
    
    var body: some View {
        Label(title, systemImage:titleIcon)
            .padding()
            .font(.system(.title, design: .rounded, weight: .heavy))
            .frame(width: 150, height: 50, alignment: .center)
            .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct MyButton2: View {
    
    var title: String
    
    
    var body: some View {
        Text(title)
            .padding()
            .font(.system(.title, design: .rounded, weight: .semibold))
            .frame(width: 220, height: 50, alignment: .center)
            .foregroundStyle(.linearGradient(colors: [Color.white.opacity(1)], startPoint: .top, endPoint: .bottom))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct MyButton_Previews: PreviewProvider {
    static var previews: some View {
        MyButton(title: "tohle je nazev", titleIcon: "arrow.uturn.left")
    }
}
