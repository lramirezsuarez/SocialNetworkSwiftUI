//
//  PostRow.swift
//  SocialNetwork
//
//  Created by Luis Ramirez on 26/03/20.
//  Copyright © 2020 Lramirez. All rights reserved.
//

import SwiftUI

struct PostRow: View {
    var post: Post
    
    var body: some View {
        VStack {
            HStack {
                Text(post.title).bold().font(.title).multilineTextAlignment(.leading)
                Spacer()
            }
            Text(post.body).font(.body).multilineTextAlignment(.leading)
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostRow(post: Post(id: 1, userID: 1, title: "This is the title", body: """
Loremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvv Loremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvv Loremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvvLoremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvv Loremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvv Loremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvv
Loremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvv
Loremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvvLoremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvvLoremp upsiisudpso ashid opaosofp oapdfoa paodpfofj padipaodpvv
"""))
    }
}
