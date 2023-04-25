//
//  AppButton.swift
//  
//
//  Created by Gaurav Kumar on 25/04/23.
//

import SwiftUI

@available(macOS 10.15, *)
struct NewButton<Content: View> : View {
    let content : ()-> Content
    let action: () -> Void

    init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.action = action
    }

    var body: some View {
        Button(action: self.action) {
            content()
        }
    }
}


@available(macOS 10.15, *)
struct NewButton_Previews: PreviewProvider {
    static var previews: some View {
        NewButton {
            print("Hello")
        } content: {
            Text("")
        }

    }
}
