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
                Text(user.name)
                Text(user.phone)
                Text(user.email)
                HStack {
                    Text("Ver publicaciones")
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: userTest).previewLayout(.fixed(width: 300, height: 100))
    }
}

let userTest = User(id: 1, name: "Lucho", username: "lramirezsuarez", email: "l@l.c", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "1234567890", website: "", company: Company(name: "Larn LTD", catchPhrase: "Best to try", bs: ""))
