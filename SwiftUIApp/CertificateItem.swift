//
//  CertificateItem.swift
//  SwiftUIApp
//
//  Created by Stanley Pan on 2019/11/08.
//  Copyright © 2019 Stanley Pan. All rights reserved.
//

import SwiftUI

struct CertificateItem: View {
    var title = "UI Design"
    var image = "Certificate1"
    var background = Color.black
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("certificate")
                        .foregroundColor(Color(.displayP3, red: 0.615686274509804, green: 0.8588235294117647, blue: 0.9058823529411765))
                }
                .frame(width: 100, alignment: .leading)
                .padding(20)
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 20.0)
            }
            
            Image(image)
                .renderingMode(.original)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight:
                    0, maxHeight: 200)
                .offset(y: 50)
        }
        .background(background)
        .cornerRadius(10)
    }
}

struct CertificateItem_Previews : PreviewProvider {
    static var previews: some View {
        CertificateItem().previewLayout(.sizeThatFits)
    }
}
