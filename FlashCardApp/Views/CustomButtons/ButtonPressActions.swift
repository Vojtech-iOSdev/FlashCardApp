//
//  ButtonPressActions.swift
//  FlashCardApp
//
//  Created by Vojtěch Kalivoda on 16.02.2023.
//

import Foundation

import SwiftUI

struct ButtonPress: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({_ in
                        onPress()
                    })
                    .onEnded({_ in
                        onRelease()
                    })
            )
    }
}

extension View {
    func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) ->
        some View {
            modifier(ButtonPress(onPress: { onPress() }, onRelease: { onRelease() } ))
    }
}
