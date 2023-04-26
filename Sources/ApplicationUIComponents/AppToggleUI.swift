//
//  AppToggleUI.swift
//  
//
//  Created by Gaurav Kumar on 26/04/23.
//

import SwiftUI

@available(iOS 13.0, *)
struct AppToggleUI: View {

    var isOn:Bool
    var body: some View {
        
        ZStack {

            Color.white
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(width: 120, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.black)
                        .frame(width: 60, height: 60),
                    alignment:isOn ?  .leading : .trailing
                )
                .animation(.linear, value: 0.2)

            HStack {
                HStack {
                    Image(systemName: "cart.fill")
                        .foregroundColor(isOn ? .white : .black)
                }.frame(width: 60, height: 60)
                //Spacer()
                HStack {
                    Image(systemName: "cart")
                        .foregroundColor(isOn ? .black : .white)
                }.frame(width: 60, height: 60)
            }

        }.frame(width: 120, height: 60)
    }
}




@available(iOS 13.0, *)
struct AppToggleUI_Previews: PreviewProvider {
    static var previews: some View {
        AppToggleUI(isOn: true)
    }
}


@available(iOS 13.0.0, *)
struct CustomToggleStyle:ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        Button {
            configuration.isOn.toggle()
        } label: {
            AppToggleUI(isOn: configuration.isOn)
        }
    }
}


