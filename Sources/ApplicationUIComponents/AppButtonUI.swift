//
//  AppButtonUI.swift
//  
//
//  Created by Gaurav Kumar on 25/04/23.
//

import SwiftUI

@available(iOS 13.0, *)
public struct AppButtonUI<Content: View> : View {
    let content : ()-> Content
    let action: () -> Void

    public init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.action = action
    }

    public var body: some View {
        Button(action: self.action) {
            content()
        }
    }
}


//@available(iOS 13.0, *)
//struct AppButtonUI_Previews: PreviewProvider {
//    static var previews: some View {
//        AppButtonUI {
//            print("Hello")
//        } content: {
//            Text("")
//        }
//
//    }
//}
