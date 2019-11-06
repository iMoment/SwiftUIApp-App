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
    @State var showProfile = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ContentView()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring(response: 0.45, dampingFraction: 0.885, blendDuration: 0))
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            
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

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        Button(action: { self.show.toggle() }) {
            HStack {
                Spacer()
                Image(systemName: "list.dash")
                    .foregroundColor(.black)
            }
            .padding(.trailing, 20)
            .frame(width: 90, height: 60)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
        }
    }
}

struct MenuRight: View {
    @Binding var show: Bool
    var body: some View {
        HStack(spacing: 12) {
            Spacer() //  Added
            Button(action: { self.show.toggle() }) {
                CircleButton(icon: "person.crop.circle")
            }
            Button(action: { self.show.toggle() }) {
                CircleButton(icon: "bell")
            }
        }
    }
}
