//
//  HomeView.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/06.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
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

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var iconName: String
}

let menuData = [
    Menu(title: "My Account", iconName: "person.crop.circle"),
    Menu(title: "Billing", iconName: "creditcard"),
    Menu(title: "Team", iconName: "person.and.person"),
    Menu(title: "Sign out", iconName: "arrow.uturn.down")
]
