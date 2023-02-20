//
//  FlashCardView.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 20.02.2023.
//

import SwiftUI

struct FlashCardView: View {
    
    var language: String
    var cardWord: String
    
    var body: some View {

        VStack(spacing: 40) {
            Text(language)
                .font(.system(.title, design: .rounded, weight: .semibold))
                .frame(maxWidth: 300, alignment: .leading)
                .shadow(color: Color.black.opacity(0.3), radius: 1, x: 0, y: 0)
            
            Text(cardWord)
                .font(.system(size: 40, weight: .heavy, design: .rounded))
        }
        .padding(.bottom, 70)
        .frame(width: 360, height: 250, alignment: .center)
        .cornerRadius(80)

    }
}

