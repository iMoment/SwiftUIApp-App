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
            HomeView().tabItem({
                Image("IconHome")
                Text("Home")
                }).tag(1)
            ContentView().tabItem({
                Image("IconCards")
                Text("Certificates")
                }).tag(2)
            UpdateList().tabItem({
                Image("IconSettings")
                Text("Updates")
                }).tag(3)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
