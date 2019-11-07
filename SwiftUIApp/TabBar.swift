//
//  TabBar.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/07.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem({
                    Image("IconHome")
                    Text("Home")
            }).tag(1)
            ContentView()
                .tabItem({
                    Image("IconCards")
                    Text("Certificates")
            }).tag(2)
            Settings()
                .tabItem({
                    Image("IconSettings")
                    Text("Settings")
            }).tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
                .environment(\.colorScheme, .dark)
            TabBar()
                .previewDevice("iPhone Xs Max")
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
