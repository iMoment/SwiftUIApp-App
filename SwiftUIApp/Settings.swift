//
//  Settings.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/07.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI

struct Settings : View {
    @State var receive = true
    @State var number: Int = 1
    @State var selection: Int = 1
    @State var date: Date = Date()
    @State var email: String = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive notifications")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) email\(number > 1 ? "s": "") per month")
                }
                Picker(selection: $selection, label: Text("Favorite course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker(selection: $date, label: {
                    Text("Date")
                })
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.emailAddress)
                }
                Button(action: { self.submit.toggle() }) {
                    Text("Save")
                }
                .alert(isPresented: $submit, content: {
                    Alert(
                        title: Text("Thanks!"),
                        message: Text("\(number) email per month\n Favorite: \(selection)\n Date: \(date)\n Email: \(email)")
                    )
                })
            }
            .navigationBarTitle(Text("Settings"))
        }
    }
}

struct Settings_Previews : PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
