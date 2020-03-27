//
//  UserRow.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import SwiftUI

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("\(user.name) - \(user.username)")
                        .bold()
                        .foregroundColor(Color(red: 0.273, green: 0.455, blue: 0.303))
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(Color(red: 0.273, green: 0.455, blue: 0.303))
                    Text(user.phone)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color(red: 0.273, green: 0.455, blue: 0.303))
                    Text(user.email)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("Open publications")
                        .foregroundColor(Color(red: 0.273, green: 0.455, blue: 0.303))
                        .font(.headline)
                        .multilineTextAlignment(.trailing)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: userTest).previewLayout(.fixed(width: 400, height: 200))
    }
}

let userTest = User(id: 1, name: "Lucho", username: "lramirezsuarez", email: "l@l.c", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "1234567890", website: "", company: Company(name: "Larn LTD", catchPhrase: "Best to try", bs: ""))
