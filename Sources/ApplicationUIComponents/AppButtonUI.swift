//
//  AppButtonUI.swift
//  
//
//  Created by Gaurav Kumar on 25/04/23.
//

import SwiftUI

@available(macOS 10.15, *)
struct AppButtonUI<Content: View> : View {
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
struct AppButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        AppButtonUI {
            print("Hello")
        } content: {
            Text("")
        }

    }
}
