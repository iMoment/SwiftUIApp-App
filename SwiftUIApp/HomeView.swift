//
//  HomeView.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/06.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Button(action: { self.show.toggle() }) {
            Text("Open Menu")
            }
            
            MenuView(show: $show)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct MenuView: View {
    @Binding var show: Bool
    
    let menuData = [
        Menu(title: "My Account", iconName: "person.crop.circle"),
        Menu(title: "Billing", iconName: "creditcard"),
        Menu(title: "Team", iconName: "person.and.person"),
        Menu(title: "Sign out", iconName: "arrow.uturn.down")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menuData) { item in
                MenuRow(image: item.iconName, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 90), axis: (x: 0.0, y: 10.0, z: 0.0))
        .animation(.default)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var iconName: String
}
