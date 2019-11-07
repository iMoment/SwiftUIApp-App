//
//  MenuView.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/08.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI

struct MenuView : View {
    var menu: [Menu] = menuData
    var showModal = false
    @State var showSettings = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(menu) { item in
                    if item.title == "Settings" {
                        MenuItem(title: item.title, icon: item.icon)
//                            .onTapGesture(perform: <#T##() -> Void#>)
//                            .onTapGesture {
//                                self.sheet(isPresented: self.$showSettings) {
//                                Settings()
//                            }
//                        }
                    } else {
                        MenuItem(title: item.title, icon: item.icon)
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("Version 0.93").foregroundColor(.gray)
                    Spacer()
                }
            }
            .frame(maxWidth: 360)
            .padding(30).padding(.top, 30)
                .background(Color("button"))
                .cornerRadius(30)
                .padding(.top, 44)
                .padding(.trailing, 50)
                .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
                .shadow(color: Color("buttonShadow"), radius: 30, x: 0, y: 10)
            
            Spacer()
        }
    }
}

struct MenuItem : View {
    var title = ""
    var icon = "creditcard"
    var body: some View {
        return HStack {
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(red: 0.6627450980392157, green: 0.7333333333333333, blue: 0.8313725490196079))
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.leading, 10)
            Spacer()
            }
            .padding(10)
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Sign out", icon: "arrow.uturn.down"),
    Menu(title: "Settings", icon: "gear")
]

struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
