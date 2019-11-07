//
//  Settings.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/07.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive Notifications")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite Course")) {
                    Text("SwiftUI").tag(1)
                    Text("React Native").tag(2)
                }
                DatePicker(selection: $date, label: {
                    Text("Date")
                })
                Section(header: Text("Email")) {
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: { self.submit.toggle() }) {
                    Text("Submit")
                }
                .alert(isPresented: $submit) { () -> Alert in
                    Alert.init(title: Text("Thank you"),
                               message: Text("Your payment has been received."),
                               dismissButton: Alert.Button.default(Text("OK"))
                    )
                }
            }.navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
